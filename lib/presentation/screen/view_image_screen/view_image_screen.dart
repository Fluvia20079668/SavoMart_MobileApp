import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../theme/theme.dart';
import '../../widgets/default_back_button.dart';
import 'view_image_screen_controller.dart';

class ViewImageScreen extends StatelessWidget {
  const ViewImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewImageScreenController viewImageScreenController = Get.find();
    viewImageScreenController.getData();
    return AnimatedBuilder(
      animation: viewImageScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: whiteColor,
            // ),
            body: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            PhotoViewGallery.builder(
                pageController: PageController(
                    initialPage: viewImageScreenController.viewImageArgs.index),
                backgroundDecoration: const BoxDecoration(color: whiteColor),
                onPageChanged: (index) {
                  viewImageScreenController.setActiveDot(index);
                },
                itemCount:
                    viewImageScreenController.viewImageArgs.images.length,
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(
                        viewImageScreenController.viewImageArgs.images[index]),
                    initialScale: PhotoViewComputedScale.contained * 0.95,
                  );
                }),
            Positioned(
              left: 0,
              right: 0,
              bottom: defaultPadding,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      viewImageScreenController.viewImageArgs.images.length,
                      (idx) {
                    return viewImageScreenController.activeIndex == idx
                        ? const ActiveDot()
                        : const InactiveDot();
                  })),
            ),

            //   DefaultIconWithContainer(
            //   url: 'assets/ic_share.png',
            //   radius: defaultPadding * .3,
            //   width: defaultPadding * 1.8,
            //   height: defaultPadding * 1.8,
            //   iconColor: whiteColor,
            //   padding: defaultPadding * .3,
            //   bgColor: blackColor.withOpacity(.5),
            //   borderColor: blackColor.withOpacity(0),
            //   onTap: () {
            //     Get.back();
            //   },
            // ),
            const Positioned(
              top: kTextTabBarHeight,
              left: defaultPadding,
              child: DefaultBackButton(),
            )
          ],
        ));
      },
    );
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: defaultPadding * .75,
        height: defaultPadding * .25,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: defaultPadding * .25,
        height: defaultPadding * .25,
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: greyColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
