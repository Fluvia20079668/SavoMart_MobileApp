import 'package:flutter_svg/svg.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/core/navigation_screen/navigation_screen_controller.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/product_details/components/product_details_carousel.dart';
import 'package:savomart/presentation/screen/product_details/components/related_item.dart';
import 'package:savomart/presentation/screen/product_details/product_details_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:savomart/presentation/widgets/default_text.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:readmore/readmore.dart';
import '../../core/navigation_screen/screens.dart';
import '../cart_screen/components/cart_update_icon.dart';
import 'components/variant_item.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsController productDetailsController = Get.find();
    final args = Get.arguments;
    productDetailsController.getData(args);
    return AnimatedBuilder(
      animation: productDetailsController,
      builder: (BuildContext context, Widget? child) {
        return NetworkResource(
          retry: () => productDetailsController.retry(),
          loading: productDetailsController.isLoading,
          appError: productDetailsController.appError,
          child: Scaffold(
              backgroundColor: whiteColor,
              appBar: AppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                backgroundColor: whiteColor,
                title: TextButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: SvgPicture.asset(
                      "assets/svgs/arrow_left.svg",
                      width: defaultPadding * .5,
                    ),
                    label: DefaultText(
                      title: AppLocalizations.of(context)!.back,
                      isBold: true,
                    )),
                actions: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          productDetailsController
                              .wishlist(productDetailsController.product!.id);
                        },
                        child: Container(
                          width: defaultPadding * 2,
                          height: defaultPadding * 2,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              border:
                                  Border.all(color: greyColor.withOpacity(.2)),
                              boxShadow: const [
                                BoxShadow(
                                  color: whiteColor,
                                  blurRadius: 6.0,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.circular(defaultPadding)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                productDetailsController.favorite.value
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  defaultSpacerHorizontalSmall,
                ],
              ),
              body: productDetailsController.product != null
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (productDetailsController
                              .product!.image!.isNotEmpty)
                            // ProductDetailsImageSection(
                            //     productDetailsController:
                            //         productDetailsController),
                            ProductDeatailsCarouselPage(
                                items: productDetailsController.product!.image!
                                    .map((e) => e.imagePath)
                                    .toList(),
                                productDetailsController:
                                    productDetailsController),
                          if (productDetailsController.product!.image!.isEmpty)
                            Container(
                              padding:
                                  const EdgeInsets.all(defaultPadding * .5),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              decoration: BoxDecoration(
                                  color: whiteColor.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(
                                      defaultPadding * .7)),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * .3,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.asset(
                                  "assets/no_image.png",
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding * .5,
                                vertical: defaultPadding * 1.1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // const DefaultText(
                                //   title: "Medical Disposable",
                                //   color: primaryColor,
                                //   isBold: true,
                                // ),
                                // const SizedBox(
                                //   height: defaultPadding * .3,
                                // ),
                                DefaultText(
                                  title: productDetailsController.product!.name,
                                  color: blackColor,
                                  isBold: true,
                                  fontSize: defaultPadding,
                                ),
                                const SizedBox(
                                  height: defaultPadding * .3,
                                ),
                                Row(
                                  children: [
                                    DefaultText(
                                      title:
                                          '${AppLocalizations.of(context)!.price_symbol} ${productDetailsController.product!.finalPrice}',
                                      color: blackColor,
                                      isBold: true,
                                      fontSize: defaultPadding,
                                    ),
                                    if (double.parse(productDetailsController
                                            .product!.finalPrice) <
                                        double.parse(productDetailsController
                                            .product!.price))
                                      defaultSpacerHorizontalSmall,
                                    if (double.parse(productDetailsController
                                            .product!.finalPrice) <
                                        double.parse(productDetailsController
                                            .product!.price))
                                      Text(
                                        "${AppLocalizations.of(context)!.price_symbol} " +
                                            productDetailsController
                                                .product!.price,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: blackColor,
                                                fontSize: defaultPadding * .7,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor: blackColor,
                                                decorationThickness: 1,
                                                letterSpacing: 0),
                                      ),
                                  ],
                                ),
                                if (productDetailsController
                                    .productVariant.isNotEmpty)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      defaultSpacerSmall,
                                      // Text(
                                      //   AppLocalizations.of(context)!
                                      //       .select_variant,
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .bodyLarge!
                                      //       .copyWith(
                                      //         fontWeight: FontWeight.bold,
                                      //       ),
                                      // ),
                                      // defaultSpacerSmall,
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ...List.generate(
                                                productDetailsController
                                                    .productVariant.length,
                                                (index) => VariantItem(
                                                      variant:
                                                          productDetailsController
                                                                  .productVariant[
                                                              index],
                                                      productDetailsController:
                                                          productDetailsController,
                                                    ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                defaultSpacer,
                                ReadMoreText(
                                  _parseHtmlString(productDetailsController
                                          .product!.description ??
                                      ""),
                                  trimLines: 10,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Read more',
                                  trimExpandedText: 'Read less',
                                  moreStyle:
                                      const TextStyle(color: primaryColorDark),
                                  lessStyle:
                                      const TextStyle(color: primaryColorDark),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: textColor,
                                          height: 1.5,
                                          fontSize: defaultPadding * .65),
                                  colorClickableText: primaryColor,
                                ),
                                defaultSpacer,
                                const SizedBox(
                                  height: kToolbarHeight * .7,
                                ),
                                if (productDetailsController
                                    .productList.isNotEmpty)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Related Products",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      defaultSpacerSmall,
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ...List.generate(
                                                productDetailsController
                                                    .productList.length,
                                                (index) => RelatedItem(
                                                    productEntity:
                                                        productDetailsController
                                                                .productList[
                                                            index]))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              bottomNavigationBar: productDetailsController.product != null
                  ? Container(
                      width: double.infinity,
                      color: whiteColor,
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment:
                                productDetailsController.product!.stockStatus ==
                                        "outofstock"
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.spaceBetween,
                            children: [
                              if (productDetailsController
                                      .product!.stockStatus !=
                                  "outofstock")
                                GestureDetector(
                                  onTap: () {
                                    productDetailsController
                                        .showAlertProductChange(context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                        defaultPadding * .5),
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: primaryColor.withOpacity(.3)),
                                      borderRadius: BorderRadius.circular(
                                          defaultPadding * .3),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        DefaultText(
                                          title:
                                              "${AppLocalizations.of(context)!.qty} : ${productDetailsController.quantity.toString()}",
                                          isBold: true,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              if (productDetailsController
                                      .product!.stockStatus !=
                                  "outofstock")
                                Container(
                                  padding:
                                      const EdgeInsets.all(defaultPadding * .5),
                                  decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(
                                          defaultPadding * .3)),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        CartUpdateIcon(
                                            iconUrl: 'assets/svgs/ic_minus.svg',
                                            onTap: () {
                                              productDetailsController
                                                  .changeQuantity("remove");
                                            }),
                                        defaultSpacerHorizontalSmall,
                                        const VerticalDivider(
                                          color: whiteColor,
                                          thickness: 2,
                                        ),
                                        defaultSpacerHorizontalSmall,
                                        CartUpdateIcon(
                                          iconUrl: 'assets/svgs/ic_add.svg',
                                          onTap: () {
                                            productDetailsController
                                                .changeQuantity("add");
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                          defaultSpacerSmall,
                          productDetailsController.product!.stockStatus ==
                                  "outofstock"
                              ? DefaultButton(
                                  text: AppLocalizations.of(context)!
                                      .out_of_stock,
                                  onPressed: () {},
                                  isLoading: false,
                                  borderRadius: defaultPadding * .3,
                                  backgroundColor: greyColor.withOpacity(.1),
                                  textColor: errorColor,
                                  isIcon: false,
                                  elevation: 0,
                                )
                              : DefaultButton(
                                  text: productDetailsController.isinCart
                                      ? AppLocalizations.of(context)!.goto_cart
                                      : AppLocalizations.of(context)!
                                          .add_to_bag,
                                  elevation: 0,
                                  backgroundColor: primaryColor,
                                  onPressed: () {
                                    if (productDetailsController.isinCart) {
                                      Get.until((route) =>
                                          Get.currentRoute ==
                                          RouteList.initial);
                                      Get.find<NavigationScreenController>()
                                          .changeScreen(Screens.cart.index);
                                    } else {
                                      productDetailsController.addToCart(
                                          productDetailsController.product!.id
                                              .toString());
                                    }
                                  },
                                  isLoading: false,
                                  borderRadius: defaultPadding * 2,
                                  isIcon: true,
                                  imageUrl: 'assets/svgs/cart_white.svg',
                                ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink()),
        );
      },
    );
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}
