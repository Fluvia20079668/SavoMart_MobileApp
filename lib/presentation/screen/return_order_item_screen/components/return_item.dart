import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/oder_entity.dart';
import '../../../theme/theme.dart';

class ReturnItem extends StatelessWidget {
  const ReturnItem({
    super.key,
    required this.ordeitem,
  });

  final OrderEntity ordeitem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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
        subtitle: Row(
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
        trailing: Text(
          "SR ${ordeitem.totalPrice}",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
