import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/domain/params/order_return_args.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/my_order_details/my_order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/oder_entity.dart';
import '../../../theme/theme.dart';

class OrderReturnItem extends StatelessWidget {
  const OrderReturnItem({
    super.key,
    required this.ordeitem,
  });

  final OrderEntity ordeitem;

  @override
  Widget build(BuildContext context) {
    MyOrderDetailsController myOrderDetailsController = Get.find();
    return ListTile(
      onTap: () {
        if (ordeitem.returnStatus == "pending") {
          Get.back();
          Get.toNamed(RouteList.returnOrderItem,
              arguments: OrderReturnArgs(
                  orderId: myOrderDetailsController.arg.toString(),
                  orderItem: ordeitem));
        }
      },
      contentPadding: const EdgeInsets.symmetric(
          horizontal: defaultPadding * .2, vertical: defaultPadding * .4),
      leading: CachedNetworkImage(
        width: defaultPadding * 2.5,
        height: defaultPadding * 2.5,
        fit: BoxFit.contain,
        imageUrl: ordeitem.image[0].imagePath,
        errorWidget: (context, url, error) => Image.asset(
          "assets/no_image.png",
        ),
      ),
      title: Text(
        ordeitem.name,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Qty : ${ordeitem.quantity}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              defaultSpacerHorizontalSmall,
              Text(
                "Price : SR ${ordeitem.unitprice}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          if (myOrderDetailsController.order != null &&
              myOrderDetailsController.order!.status != "returned" &&
              ordeitem.returnStatus != "pending")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: defaultPadding * .2,
                ),
                Text(
                  AppLocalizations.of(context)!.already_returned,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: defaultPadding * .4,
                      color: errorColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
        ],
      ),
      trailing: Text(
        "SR ${ordeitem.totalPrice}",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
