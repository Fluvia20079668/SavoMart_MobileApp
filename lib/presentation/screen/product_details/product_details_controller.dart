import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/domain/entities/banner_entity.dart';
import 'package:savomart/domain/entities/product_entity.dart';
import 'package:savomart/domain/entities/variant_entity.dart';
import 'package:savomart/domain/params/product_params.dart';
import 'package:savomart/domain/usecases/related_product_usecase.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/core/navigation_screen/navigation_screen_controller.dart';
import 'package:savomart/presentation/screen/product_details/components/quantity_change_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/product_details.dart';
import '../../../domain/params/add_to_cart_params.dart';
import '../../../domain/params/wishlist_params.dart';
import '../../../domain/usecases/add_to_wishlist_usecase.dart';
import '../../../domain/usecases/addtocart_usecase.dart';
import '../../../domain/usecases/product_details_usecase.dart';
import '../../../utils/snackbar_uils.dart';
import '../../theme/theme.dart';

class ProductDetailsController extends ChangeNotifier {
  List<ProductEntity> productList = [];
  late VariantProduct selectedVariant;
  late VariantEntity variantEntity;
  List<BannerEntity> images = [];
  ProductDetailsUsecase productDetailsUsecase = Get.find();
  AddToCartUsecase addToCartUsecase = Get.find();
  AddToWishListUseCase addToWishListUseCase = Get.find();
  RelatedProductUsecase relatedProductUsecase = Get.find();
  NavigationScreenController navigationScreenController = Get.find();
  int selectedImageIndex = 0;
  Product? product;
  int quantity = 1;
  RxBool favorite = false.obs;
  List<String> productQty = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  String selectedQty = "1";
  List itemlist = [];
  String? productId;
  bool isinCart = false;
  bool isinWishList = false;
  String productType = "";
  String? alertQty;

  List<ProductEntity> productVariant = [];

  AppError? appError;
  bool isLoading = true;
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

  getData([args]) async {
    appError = null;
    productType = "";
    makeLoading();
    ProductParams productParams = ProductParams(
      id: args.toString(),
    );
    productId = args.toString();
    final response = await productDetailsUsecase(productParams);
    response.fold((l) => l.handleError(), (r) {
      if (r.status) {
        product = r.product;
        isinCart = r.product.isInCart;
        isinWishList = r.product.isInWishlist;
        favorite.value = r.product.isInWishlist;
        productVariant = r.product.variations;
        productType = r.product.type;

        if (r.product.cartQuantity == "0") {
          quantity = 1;
        } else {
          quantity = double.parse(r.product.cartQuantity).toInt();
        }
        makeNotLoading();
      }
    });
    getRelatedProduct(args.toString());
  }

  wishlist([int? id]) {
    favorite.value = !favorite.value;
    if (favorite.value) {
      addToWhishList(id, "add");
    } else {
      addToWhishList(id, "");
    }

    notifyListeners();
  }

  addToWhishList(productid, action) async {
    WhishListParam whishListParam =
        WhishListParam(productId: productid.toString(), action: action);
    final response = await addToWishListUseCase(whishListParam);
    response.fold((l) => l.handleError(), (r) {
      if (r["status"]) {}
      showMessage(r['message']);
    });
    makeNotLoading();
  }

  changeQuantity(action) {
    if (action == "add") {
      quantity = quantity + 1;
      notifyListeners();
    } else if (action == "remove") {
      if (quantity != 1) {
        quantity = quantity - 1;
        notifyListeners();
      }
    }
  }

  addToCart([String? id]) async {
    if (productType != "configurable_product") {
      AddToCartParam addtocartParams = AddToCartParam(
        productId: id.toString(),
        quantity: quantity.toString(),
      );
      final response = await addToCartUsecase(addtocartParams);
      response.fold((l) => l.handleError(), (r) {
        if (r["status"]) {
          isinCart = true;
          navigationScreenController.getData();
        }
        showMessage(r['message']);
      });
      makeNotLoading();
    } else {
      showMessage(AppLocalizations.of(Get.context!)!.select_variant);
    }
  }

  void changeVariant(VariantProduct e) {
    selectedVariant = e;
    notifyListeners();
  }

  chnageImagePreview(int index) {
    selectedImageIndex = index;
    notifyListeners();
  }

  getRelatedProduct(String productId) async {
    RelatedProductParams relatedProductParams =
        RelatedProductParams(productId: productId);
    final response = await relatedProductUsecase(relatedProductParams);
    response.fold((l) => l.handleError(), (r) {
      if (r.status) {
        productList = r.data.products;
      }
    });
    notifyListeners();
  }

  onChangeQty(String? val) {
    selectedQty = val!;
    notifyListeners();
  }

  showAlertProductChange(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(10),
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    defaultPadding * .5)), //this right here
            child: QuantityChangeAlert(
              productEntity: ProductEntity(
                  id: productId!,
                  name: product!.name,
                  imageUrl: product!.image!.isNotEmpty
                      ? product!.image![0].imagePath
                      : "",
                  price: product!.finalPrice,
                  cutPrice: double.parse(product!.finalPrice) <
                          double.parse(product!.price)
                      ? product!.price
                      : "",
                  qty: quantity.toString()),
            ),
          );
        });
  }

  onChangeValue(String val) {
    alertQty = val;
    notifyListeners();
  }

  applyCartUpdate(ProductEntity productEntity) {
    quantity = int.parse(alertQty!);
    notifyListeners();
  }
}
