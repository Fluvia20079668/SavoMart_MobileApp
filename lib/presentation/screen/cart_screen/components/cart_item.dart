import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/domain/entities/product_entity.dart';
import 'package:savomart/presentation/screen/cart_screen/cart_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/widgets/default_icon_button.dart';
import 'package:savomart/presentation/widgets/default_text.dart';
import 'package:savomart/l10n/app_localizations.dart';
import '../../../route/route_constants.dart';
import 'cart_update_icon.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    this.id,
    this.name,
    this.image,
    this.amount,
    this.quantity,
    this.controller,
    this.onpress,
    required this.increasecartitem,
    required this.decreasecartitem,
    this.stockStatus,
    this.price,
    this.cutPrice,
    Key? key,
  }) : super(key: key);
  final String? name;
  final String? image;
  final String? amount;
  final String? quantity;
  final String? id;
  final void Function() increasecartitem;
  final void Function() decreasecartitem;
  final Function(BuildContext)? onpress;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String? stockStatus;
  final String? price;
  final String? cutPrice;

  @override
  Widget build(BuildContext context) {
    CartScreenController cartScreenController = Get.find();
    return Container(
      padding: const EdgeInsets.all(defaultPadding * .6),
      margin: const EdgeInsets.only(bottom: defaultPadding * .5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding * .5),
          color: whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteList.productDetails, arguments: id);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(defaultPadding * .5),
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width * .3,
                    fit: BoxFit.cover,
                    imageUrl: image ?? "",
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/no_image.png",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: defaultPadding * .7,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: DefaultIconButton(
                        onTap: () {
                          cartScreenController.deleteCartItem(id);
                        },
                        iconUrl: "assets/svgs/ic_close.svg",
                        iconSize: defaultPadding * .7,
                        iconColor: primaryColor,
                      ),
                    ),
                    // const DefaultText(
                    //   title: "Medical Disposable",
                    //   maxLine: 1,
                    //   fontSize: defaultPadding * .5,
                    //   isBold: true,
                    //   color: primaryColor,
                    // ),
                    const SizedBox(
                      height: defaultPadding * .1,
                    ),
                    DefaultText(
                      title: name ?? "",
                      maxLine: 2,
                      fontSize: defaultPadding * .6,
                      isBold: true,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Expanded(
                    //       child: Text(
                    //         name ?? "",
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .titleSmall!
                    //             .copyWith(fontWeight: FontWeight.bold),
                    //         maxLines: 2,
                    //         overflow: TextOverflow.ellipsis,
                    //       ),
                    //     ),
                    //     defaultSpacerHorizontalSmall,
                    //     Text(
                    //       "SR $price",
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .titleSmall!
                    //           .copyWith(color: greyColor),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: defaultPadding * .2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DefaultText(
                            title:
                                "${AppLocalizations.of(context)!.price_symbol} $amount",
                            fontSize: defaultPadding * .7,
                            isBold: true,
                          ),
                        ),
                        DefaultText(
                            title:
                                "${AppLocalizations.of(context)!.price_symbol} $price x ${quantity != null ? double.parse(quantity!).toStringAsFixed(0) : ""}",
                            fontSize: defaultPadding * .5)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          defaultSpacerSmall,
          Row(
            mainAxisAlignment: stockStatus == "outofstock"
                ? MainAxisAlignment.end
                : MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  cartScreenController.cartQtyChangeAlert(
                      ProductEntity(
                          id: id!,
                          name: name!,
                          imageUrl: image!,
                          price: price!,
                          cutPrice:
                              double.parse(price!) < double.parse(cutPrice!)
                                  ? cutPrice
                                  : "",
                          qty: quantity),
                      context);
                },
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding * .5),
                  width: MediaQuery.of(context).size.width * .3,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: primaryColor.withOpacity(.3)),
                    borderRadius: BorderRadius.circular(defaultPadding * .3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultText(
                        title:
                            "${AppLocalizations.of(context)!.qty} : ${quantity != null ? double.parse(quantity!).toStringAsFixed(0) : ""}",
                        isBold: true,
                      )
                    ],
                  ),
                ),
              ),
              stockStatus == "outofstock"
                  ? Text(
                      AppLocalizations.of(context)!.out_of_stock,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: errorColor,
                          fontSize: defaultPadding * .7),
                    )
                  : Container(
                      padding: const EdgeInsets.all(defaultPadding * .5),
                      decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.3),
                          borderRadius:
                              BorderRadius.circular(defaultPadding * .3)),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            CartUpdateIcon(
                              iconUrl: 'assets/svgs/ic_minus.svg',
                              onTap: decreasecartitem,
                            ),
                            defaultSpacerHorizontalSmall,
                            const VerticalDivider(
                              color: whiteColor,
                              thickness: 2,
                            ),
                            defaultSpacerHorizontalSmall,
                            CartUpdateIcon(
                              iconUrl: 'assets/svgs/ic_add.svg',
                              onTap: increasecartitem,
                            ),
                          ],
                        ),
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}
