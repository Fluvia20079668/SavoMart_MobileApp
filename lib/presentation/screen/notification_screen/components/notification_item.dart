import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: const EdgeInsets.all(defaultPadding * .5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/offer.png',
              width: defaultPadding,
              height: defaultPadding,
            ),
            defaultSpacerHorizontalSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Text fngjfhjgjfgjfghfj",
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: defaultPadding * .2,
                  ),
                  Text(
                      "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document ",
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(
                    height: defaultPadding * .3,
                  ),
                  Text("1 day ago",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: blackColor.withOpacity(.6),
                          fontSize: defaultPadding * .5))
                ],
              ),
            ),
            defaultSpacerHorizontalSmall,
            CachedNetworkImage(
              width: defaultPadding * 3,
              height: defaultPadding * 3,
              fit: BoxFit.contain,
              imageUrl:
                  "https://mobilemarketingmagazine.com/wp-content/uploads/posts/Flipkart_SuperCoin.jpg",
              errorWidget: (context, url, error) => Image.asset(
                "assets/no_image.png",
              ),
            )
          ],
        ),
      ),
    );
  }
}
