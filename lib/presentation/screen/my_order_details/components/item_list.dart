import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/domain/entities/oder_entity.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/checkout_screen/components/delivery_address.dart';
import 'package:savomart/presentation/screen/my_order_details/my_order_details_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/widgets/default_text.dart';

import '../../../route/route_constants.dart';

class ItemList extends StatelessWidget {
  const ItemList({this.ordeitem, Key? key}) : super(key: key);
  final List<OrderEntity>? ordeitem;
  @override
  Widget build(BuildContext context) {
    MyOrderDetailsController myOrderDetailsController = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding * .5,
        vertical: defaultPadding,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(defaultPadding * .5),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * .5,
            ),
            child: TitleWithButton(
              title: AppLocalizations.of(context)!.items,
              buttonText: "",
              onTap: () {},
            ),
          ),
          defaultSpacerSmall,
          ...List.generate(
            ordeitem!.length,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: defaultPadding * .3),
              child: ListTile(
                dense: true,
                leading: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      RouteList.productDetails,
                      arguments: ordeitem![index].productId,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(defaultPadding * .2),
                    child: CachedNetworkImage(
                      width: defaultPadding * 3,
                      height: defaultPadding * 3,
                      fit: BoxFit.cover,
                      imageUrl: ordeitem![index].image[0].imagePath,
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/no_image.png"),
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const DefaultText(
                    //   title: "Medical Disposable",
                    //   color: primaryColor,
                    //   maxLine: 1,
                    //   isBold: true,
                    //   fontSize: defaultPadding * .45,
                    // ),
                    DefaultText(
                      title: ordeitem![index].name,
                      fontSize: defaultPadding * .7,
                      isBold: true,
                      maxLine: 1,
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          title: "Qty : ${ordeitem![index].quantity}",
                          fontSize: defaultPadding * .55,
                        ),
                        defaultSpacerHorizontalSmall,
                        DefaultText(
                          title:
                              "Price : ${AppLocalizations.of(context)!.price_symbol} ${ordeitem![index].unitprice}",
                          fontSize: defaultPadding * .55,
                        ),
                      ],
                    ),
                    if (myOrderDetailsController.order != null &&
                        myOrderDetailsController.order!.status != "returned" &&
                        ordeitem![index].returnStatus != "pending")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: defaultPadding * .2),
                          Text(
                            AppLocalizations.of(context)!.already_returned,
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  fontSize: defaultPadding * .4,
                                  color: errorColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                  ],
                ),
                trailing: Text(
                  "${AppLocalizations.of(context)!.price_symbol} ${ordeitem![index].totalPrice}",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
