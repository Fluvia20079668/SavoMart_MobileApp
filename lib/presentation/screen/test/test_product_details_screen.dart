import 'package:cached_network_image/cached_network_image.dart';
import 'package:savomart/presentation/screen/test/test_product_details_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestProductDetails extends StatelessWidget {
  const TestProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TestProductDetailsController testProductDetailsController = Get.find();
    testProductDetailsController.getData();
    return AnimatedBuilder(
      animation: testProductDetailsController,
      builder: (BuildContext context, Widget? child) {
        return NetworkResource(
          appError: testProductDetailsController.appError,
          loading: testProductDetailsController.isLoading,
          retry: () => testProductDetailsController.retry(),
          child: Scaffold(
            appBar: AppBar(
            ),
            body: SingleChildScrollView(
              child: testProductDetailsController.productDetailsChangeField !=
                      null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding * .5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(defaultPadding * .5),
                            margin: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            decoration: BoxDecoration(
                                color: whiteColor.withOpacity(.5),
                                borderRadius:
                                    BorderRadius.circular(defaultPadding * .7)),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .3,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: CachedNetworkImage(
                                imageUrl: testProductDetailsController
                                    .productDetailsChangeField!
                                    .productImage![0],
                                fit: BoxFit.contain,
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  "assets/no_image.png",
                                ),
                              ),
                            ),
                          ),
                          defaultSpacer,
                          Text(
                            testProductDetailsController
                                .productDetailsChangeField!.productName!,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          defaultSpacerSmall,
                          Text(
                            testProductDetailsController
                                .productDetailsChangeField!.productPrice!,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          ...List.generate(
                            testProductDetailsController
                                .productDetails!["data"]["product_options"]
                                .length,
                            (index) => Column(
                              children: [
                                ListTile(
                                  onTap: ()=>testProductDetailsController.variantClick(context),
                                  dense: true,
                                  title: Row(
                                    children: [
                                      Text(
                                          "${testProductDetailsController.productDetails!["data"]["product_options"][index]["label"]} :"),
                                      defaultSpacerHorizontalSmall,
                                      Text(
                                          testProductDetailsController
                                                      .initialState[index],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${testProductDetailsController.productDetails!["data"]["product_options"][index]["option_data"].length} more",
                                        style:
                                            Theme.of(context).textTheme.bodySmall,
                                      ),
                                      defaultSpacerHorizontalSmall,
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: defaultPadding * .75,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ...List.generate(
                          //     testProductDetailsController
                          //         .productDetails!["data"]["product_options"]
                          //         .length,
                          //     (index) => Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               testProductDetailsController
                          //                       .productDetails!["data"]
                          //                   ["product_options"][index]["label"],
                          //               style: Theme.of(context)
                          //                   .textTheme
                          //                   .subtitle2!
                          //                   .copyWith(
                          //                       fontWeight: FontWeight.bold),
                          //             ),
                          //             defaultSpacerSmall,
                          //             Row(
                          //               children: [
                          //                 ...List.generate(
                          //                     testProductDetailsController
                          //                         .productDetails!["data"]
                          //                             ["product_options"][index]
                          //                             ["option_data"]
                          //                         .length,
                          //                     (pos) => GestureDetector(
                          //                           onTap: () {
                          //                             testProductDetailsController.attributeClick(
                          //                                 testProductDetailsController
                          //                                                 .productDetails![
                          //                                             "data"][
                          //                                         "product_options"][index]
                          //                                     [
                          //                                     "option_data"][pos],
                          //                                 index,
                          //                                 pos);
                          //                           },
                          //                           child: Container(
                          //                             margin:
                          //                                 const EdgeInsets.all(
                          //                                     defaultPadding *
                          //                                         .2),
                          //                             padding:
                          //                                 const EdgeInsets.all(
                          //                                     defaultPadding *
                          //                                         .3),
                          //                             decoration: BoxDecoration(
                          //                                 color: testProductDetailsController
                          //                                                     .optionData[
                          //                                                 index]
                          //                                             [pos] ==
                          //                                         true
                          //                                     ? primaryColor
                          //                                     : whiteColor,
                          //                                 borderRadius:
                          //                                     BorderRadius.circular(
                          //                                         defaultPadding *
                          //                                             .2),
                          //                                 border: Border.all(
                          //                                   color: testProductDetailsController
                          //                                                   .optionData[index]
                          //                                               [pos] ==
                          //                                           true
                          //                                       ? primaryColor
                          //                                       : greyColor,
                          //                                 )),
                          //                             child: Text(testProductDetailsController
                          //                                             .productDetails![
                          //                                         "data"][
                          //                                     "product_options"]
                          //                                 [
                          //                                 index]["option_data"][pos]),
                          //                           ),
                          //                         ))
                          //               ],
                          //             ),
                          //             defaultSpacerSmall
                          //           ],
                          //         )),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
