import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/presentation/screen/product_details/product_details_controller.dart';
import 'package:savomart/utils/formaters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/product_entity.dart';
import 'package:savomart/l10n/app_localizations.dart';
import '../../../theme/theme.dart';
import '../../../widgets/default_button.dart';

class QuantityChangeAlert extends StatelessWidget {
  const QuantityChangeAlert({
    Key? key,
    required this.productEntity,
  }) : super(key: key);

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    ProductDetailsController productDetailsController = Get.find();
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding, horizontal: defaultPadding * .6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(defaultPadding * .3),
                  child: CachedNetworkImage(
                    width: defaultPadding * 4,
                    fit: BoxFit.cover,
                    imageUrl: productEntity.imageUrl,
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/no_image.png",
                    ),
                  ),
                ),
                defaultSpacerHorizontal,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productEntity.name.toCapitalize(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      defaultSpacerSmall,
                      Text(
                        "₹ ${productEntity.price}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: defaultPadding * .1,
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(height: 1.5),
                          children: <TextSpan>[
                            if (productEntity.cutPrice != "")
                              TextSpan(
                                  text: '${productEntity.cutPrice}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.lineThrough,
                                      )),
                          ],
                        ),
                      ),
                      defaultSpacerSmall,
                      // if (productEntity.stockStatus == "outofstock")
                      //   Text(
                      //     "Out of Stock",
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .titleMedium!
                      //         .copyWith(
                      //             color: errorColor,
                      //             fontWeight: FontWeight.bold),
                      //   ),
                      SizedBox(
                        width: defaultPadding * 7,
                        height: defaultPadding * 2.2,
                        child: TextFormField(
                          controller: TextEditingController(
                            text: (double.parse(productEntity.qty!).toInt())
                                .toString(),
                          ),
                          style: Theme.of(context).textTheme.titleSmall,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                          ],
                          onChanged: (val) {
                            productDetailsController.onChangeValue(val);
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              fillColor: greyColor.withOpacity(.15),
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(defaultPadding / 2),
                                  borderSide: BorderSide.none),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(defaultPadding / 2),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(defaultPadding / 2),
                                  borderSide: BorderSide.none),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(defaultPadding / 2),
                                  borderSide: BorderSide.none),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(defaultPadding / 2),
                                  borderSide: BorderSide.none)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            defaultSpacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .25,
                  height: defaultPadding * 2.2,
                  child: DefaultButton(
                    text: AppLocalizations.of(context)!.cancel,
                    onPressed: () {
                      Get.back();
                    },
                    isLoading: false,
                    backgroundColor: errorColor,
                    elevation: 0,
                  ),
                ),
                defaultSpacerHorizontalSmall,
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  height: defaultPadding * 2.2,
                  child: DefaultButton(
                    text: AppLocalizations.of(context)!.ok,
                    onPressed: () {
                      if (productDetailsController.alertQty != "") {
                        Get.back();
                        productDetailsController.applyCartUpdate(productEntity);
                      }
                    },
                    backgroundColor: successColor,
                    isLoading: false,
                    elevation: 0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
