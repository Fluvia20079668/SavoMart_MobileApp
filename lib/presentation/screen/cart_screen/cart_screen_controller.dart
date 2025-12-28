import 'package:savomart/domain/entities/product_entity.dart';
import 'package:savomart/domain/params/add_to_cart_params.dart';
import 'package:savomart/domain/params/no_params.dart';
import 'package:savomart/domain/params/remove_cart_param.dart';
import 'package:savomart/domain/usecases/addtocart_usecase.dart';
import 'package:savomart/domain/usecases/cart_list_usecase.dart';
import 'package:savomart/domain/usecases/remove_cart_item_usecase.dart';
import 'package:savomart/presentation/screen/cart_screen/components/cart_alert_item.dart';
import 'package:savomart/utils/snackbar_uils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/app_error.dart';
import '../../theme/theme.dart';

class CartScreenController extends ChangeNotifier {
  AppError? appError;
  bool isLoading = true;
  CartListUsecase cartListUsecase = Get.find();
  RemoveCartItemUseCase removeCartItemUseCase = Get.find();
  AddToCartUsecase addToCartUsecase = Get.find();
  bool proceedToCheckout = true;
  String? alertQty;

  String? totalitem;
  String? totalamount;
  String? cartId;
  int quantity = 0;
  List itemlist = [];
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  retry() async {
    makeLoading();
    getData();
  }

  deleteCartItem(id) async {
    RemoveCartParam removeCartParam = RemoveCartParam(productId: id.toString());
    final responses = await removeCartItemUseCase(removeCartParam);
    responses.fold((l) => l.handleError(), (r) {
      if (r['status']) {
        showMessage(r["message"]);
        getData();
      } else {
        makeNotLoading();
      }
    });
  }

  decreaseCart(id, quantitys) async {
    double doubleValue = double.parse(quantitys);
    int intValue = doubleValue.toInt();
    if (intValue > 1) {
      quantity = intValue - 1;
      AddToCartParam addtocartParams = AddToCartParam(
        productId: id,
        quantity: quantity.toString(),
      );
      updateCart(addtocartParams);
    }
  }

  increaseCart(id, quantitys) async {
    double doubleValue = double.parse(quantitys);
    int intValue = doubleValue.toInt();
    quantity = intValue + 1;
    AddToCartParam addtocartParams = AddToCartParam(
      productId: id,
      quantity: quantity.toString(),
    );
    updateCart(addtocartParams);
  }

  updateCart(addtocartParams) async {
    final response = await addToCartUsecase(addtocartParams);
    response.fold((l) => l.handleError(), (r) {
      if (r["status"]) {
        getData();
      }
      showMessage(r['message']);
    });
    makeNotLoading();
  }

  getData() async {
    final responses = await cartListUsecase(NoParams());
    responses.fold((l) => l.handleError(), (r) {
      if (r.status) {
        cartId = r.cart.cartId.toString();
        totalitem = r.cart.totalItems;
        totalamount = r.cart.grandTotal;
        itemlist = r.cart.cartItems;
        checkStockStatus();
        makeNotLoading();
      } else {
        makeNotLoading();
      }
    });
  }

  checkStockStatus() {
    proceedToCheckout = itemlist.firstWhereOrNull(
                (element) => element.stockStatus == "outofstock") !=
            null
        ? false
        : true;
    notifyListeners();
  }

  cartQtyChangeAlert(ProductEntity productEntity, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(10),
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    defaultPadding * .5)), //this right here
            child: CartAlertItem(
              productEntity: productEntity,
            ),
          );
        });
  }

  onChangeValue(String val) {
    alertQty = val;
    notifyListeners();
  }

  applyCartUpdate(ProductEntity productEntity) {
    AddToCartParam addtocartParams = AddToCartParam(
      productId: productEntity.id,
      quantity: alertQty!,
    );
    updateCart(addtocartParams);
  }
}
