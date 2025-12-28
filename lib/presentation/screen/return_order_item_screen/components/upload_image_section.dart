import 'package:savomart/presentation/screen/return_order_item_screen/return_order_item_controller.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../../widgets/removable_file_image.dart';

class UploadImageSection extends StatelessWidget {
  const UploadImageSection({
    Key? key,
    required this.orderReturnController,
  }) : super(key: key);

  final ReturnOrderItemController orderReturnController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding * 1.5, horizontal: defaultPadding),
          decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: blackColor.withOpacity(.5)),
              borderRadius: BorderRadius.circular(defaultPadding * .5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  orderReturnController.uploadImage();
                },
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.cloud_upload,
                        size: defaultPadding * 3,
                        color: blackColor.withOpacity(.7),
                      ),
                      Text(
                        "Upload Image",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        defaultSpacer,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(orderReturnController.returnImage.length,
                  (index) {
                final imageFile = orderReturnController.returnImage[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * .3),
                  child: RemovableFileImage(
                    image: imageFile,
                    index: index,
                    removeImage: orderReturnController.removeDocument,
                    width: defaultPadding * 4.5,
                    height: defaultPadding * 4.5,
                    pos: -(defaultPadding * .4),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
