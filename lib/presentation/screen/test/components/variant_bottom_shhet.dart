import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../test_product_details_controller.dart';

class VariantBottomSheet extends StatelessWidget {
  const VariantBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TestProductDetailsController testProductDetailsController = Get.find();
    return AnimatedBuilder(
      animation: testProductDetailsController,
      builder: (BuildContext context, Widget? child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .8,
          child: Scaffold(
            appBar: AppBar(
              elevation: .5,
              title: Text(
                "Select Variant",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              centerTitle: false,
              leading: IconButton(
                  onPressed: () => Get.back(), icon: const Icon(Icons.close)),
            ),
            body: Padding(
              padding: const EdgeInsets.all(defaultPadding * .5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding,
                        horizontal: defaultPadding * .5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(testProductDetailsController
                            .productDetailsChangeField!.productName!),
                        defaultSpacerSmall,
                        Text(
                          testProductDetailsController
                              .productDetailsChangeField!.productPrice!,
                          style:
                              Theme.of(context).textTheme.headline6BoldBlack(),
                        )
                      ],
                    ),
                  ),
                  ...List.generate(
                      testProductDetailsController
                          .productDetails!["data"]["product_options"].length,
                      (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                testProductDetailsController
                                        .productDetails!["data"]
                                    ["product_options"][index]["label"],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              defaultSpacerSmall,
                              Row(
                                children: [
                                  ...List.generate(
                                      testProductDetailsController
                                          .productDetails!["data"]
                                              ["product_options"][index]
                                              ["option_data"]
                                          .length,
                                      (pos) => GestureDetector(
                                            onTap: () {
                                              testProductDetailsController.attributeClick(
                                                  testProductDetailsController
                                                                  .productDetails![
                                                              "data"]
                                                          ["product_options"][
                                                      index]["option_data"][pos],
                                                  index,
                                                  pos);
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(
                                                  defaultPadding * .2),
                                              padding: const EdgeInsets.all(
                                                  defaultPadding * .3),
                                              decoration: BoxDecoration(
                                                  color:
                                                      testProductDetailsController
                                                                      .optionData[
                                                                  index][pos] ==
                                                              true
                                                          ? primaryColor
                                                          : whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          defaultPadding * .2),
                                                  border: Border.all(
                                                    color: testProductDetailsController
                                                                    .optionData[
                                                                index][pos] ==
                                                            true
                                                        ? primaryColor
                                                        : greyColor,
                                                  )),
                                              child: Text(
                                                testProductDetailsController
                                                                .productDetails![
                                                            "data"]
                                                        ["product_options"]
                                                    [index]["option_data"][pos],
                                                style: TextStyle(
                                                  color:
                                                      testProductDetailsController
                                                                      .optionData[
                                                                  index][pos] ==
                                                              true
                                                          ? whiteColor
                                                          : blackColor,
                                                ),
                                              ),
                                            ),
                                          ))
                                ],
                              ),
                              defaultSpacerSmall,
                            ],
                          )),
                  if (testProductDetailsController.combinationErrorText != "")
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding * .5),
                      child: Text(
                        testProductDetailsController.combinationErrorText,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: errorColor),
                      ),
                    )
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(defaultPadding * .5),
              child: Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                        text: "CANCEL",
                        backgroundColor: whiteColor,
                        textColor: blackColor,
                        onPressed: () {
                          Get.back();
                        },
                        isLoading: false),
                  ),
                  defaultSpacerHorizontalSmall,
                  Expanded(
                    child: DefaultButton(
                        backgroundColor:
                            testProductDetailsController.choosenSku != null
                                ? primaryColor
                                : greyColor.withOpacity(.5),
                        text: "APPLY",
                        onPressed: () {
                          testProductDetailsController.choosenSku != null
                              ? Get.back()
                              : null;
                        },
                        isLoading: false),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
