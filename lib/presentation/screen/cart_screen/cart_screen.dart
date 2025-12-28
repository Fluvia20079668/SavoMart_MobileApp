import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/cart_screen/cart_screen_controller.dart';
import 'package:savomart/presentation/widgets/default_appbar.dart';
import 'package:savomart/presentation/widgets/header_with_padding.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:get/get.dart';

import '../../widgets/network_resource.dart';
import 'components/cart_item.dart';
import 'components/cart_price_details.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartScreenController cartScrenController = Get.find();
    cartScrenController.getData();
    return AnimatedBuilder(
        animation: cartScrenController,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: DefaultAppBar()),
            // drawer: const NavDrawer(),
            body: NetworkResource(
              appError: cartScrenController.appError,
              loading: cartScrenController.isLoading,
              retry: () => cartScrenController.retry(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding * .5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: HeaderWithPadding(
                              text: AppLocalizations.of(context)!.cart,
                            ),
                          ),
                          defaultSpacerSmall,
                          if (cartScrenController.itemlist.isNotEmpty)
                            ...List.generate(
                              cartScrenController.itemlist.length,
                              (index) {
                                var item = cartScrenController.itemlist[index];
                                return CartItem(
                                  decreasecartitem: () {
                                    cartScrenController.decreaseCart(
                                        item.productId.toString(),
                                        item.quantity);
                                  },
                                  increasecartitem: () {
                                    cartScrenController.increaseCart(
                                        item.productId.toString(),
                                        item.quantity);
                                  },
                                  onpress: (value) {
                                    cartScrenController.deleteCartItem(
                                        item.productId.toString());
                                  },
                                  id: item.productId.toString(),
                                  name: item.name,
                                  image: item.image.isNotEmpty
                                      ? item.image[0].imagePath
                                      : "",
                                  quantity: item.quantity,
                                  amount: item.totalPrice,
                                  stockStatus: item.stockStatus,
                                  price: item.finalPrice,
                                  cutPrice: item.price,
                                );
                              },
                            ),
                          if (cartScrenController.itemlist.isEmpty)
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 1.6,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/Object 1.png",
                                        height: 130,
                                        width: 120,
                                      ),
                                      defaultSpacer,
                                      const Text("No item in cart"),
                                    ],
                                  ),
                                )),
                          defaultSpacer,
                        ],
                      ),
                    ),
                    if (cartScrenController.totalitem != null &&
                        cartScrenController.totalamount != null &&
                        cartScrenController.itemlist.isNotEmpty)
                      CartPriceDetails(
                          itemcount: cartScrenController.totalitem,
                          totalamount: cartScrenController.totalamount),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: cartScrenController.itemlist.isNotEmpty
                ? Container(
                    color: whiteColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding * .5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: ListTile(
                          title: Text(
                            AppLocalizations.of(context)!.total_price,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: blackColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "${AppLocalizations.of(context)!.price_symbol} ${cartScrenController.totalamount ?? ""}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: blackColor,
                                    fontWeight: FontWeight.bold),
                          ),
                        )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: DefaultButton(
                              text: AppLocalizations.of(context)!.checkout,
                              elevation: 0,
                              onPressed: () {
                                if (cartScrenController.proceedToCheckout) {
                                  Get.toNamed(RouteList.checkoutScreen,
                                      arguments: [
                                        cartScrenController.cartId,
                                        cartScrenController.totalitem,
                                        cartScrenController.totalamount
                                      ]);
                                }
                              },
                              backgroundColor:
                                  cartScrenController.proceedToCheckout
                                      ? primaryColorDark
                                      : greyColor.withOpacity(.2),
                              isLoading: false,
                              isIcon: true,
                              imageUrl: 'assets/svgs/check_out.svg',
                            ))
                      ],
                    ),
                  )
                : const SizedBox(
                    height: 0,
                  ),
          );
        });
  }
}
