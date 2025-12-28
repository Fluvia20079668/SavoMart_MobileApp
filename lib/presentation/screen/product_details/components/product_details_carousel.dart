// ignore_for_file: library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../product_details_controller.dart';
import 'details_banner_item.dart';

class ProductDeatailsCarouselPage extends StatefulWidget {
  final List<String> items;
  final ProductDetailsController productDetailsController;

  const ProductDeatailsCarouselPage(
      {Key? key, required this.items, required this.productDetailsController})
      : super(key: key);

  @override
  _ProductDeatailsCarouselPageState createState() =>
      _ProductDeatailsCarouselPageState();
}

class _ProductDeatailsCarouselPageState
    extends State<ProductDeatailsCarouselPage> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(defaultPadding * .5)),
          ),
          CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .4,
                onPageChanged: (index, reason) {
                  setActiveDot(index);
                },
                autoPlay: widget.items.length == 1 ? false : true,
                autoPlayCurve: Curves.ease,
                viewportFraction: 1,
              ),
              items: List.generate(
                  widget.items.length,
                  (index) => DetailsBannerItem(
                        item: widget.items[index],
                        images: widget.items,
                        index: index,
                      ))),
          // Positioned(
          //   left: defaultPadding * .8,
          //   bottom: defaultPadding * .8,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(
          //         horizontal: defaultPadding * .7,
          //         vertical: defaultPadding * .2),
          //     decoration: BoxDecoration(
          //         color: whiteColor,
          //         borderRadius: BorderRadius.circular(defaultPadding)),
          //     child: Text(
          //       "${activeIndex + 1}/${widget.items.length}",
          //       style: Theme.of(context)
          //           .textTheme
          //           .bodyLarge!
          //           .copyWith(fontSize: defaultPadding * .5, color: blackColor),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
