import 'package:savomart/presentation/screen/return_order_item_screen/return_order_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:savomart/l10n/app_localizations.dart';
import '../../theme/theme.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_title_with_text.dart';
import 'components/order_return_form.dart';
import 'components/return_item.dart';
import 'components/upload_image_section.dart';

class ReturnOrderItemScreen extends StatelessWidget {
  const ReturnOrderItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReturnOrderItemController returnOrderItemController = Get.find();
    return AnimatedBuilder(
      animation: returnOrderItemController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: scaffoldBg,
            title: Text(
              AppLocalizations.of(context)!.return_order,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding * .5),
              child: Column(
                children: [
                   ReturnItem(ordeitem: returnOrderItemController.orderReturnArgs.orderItem,),
                  defaultSpacer,
                  OrderRetunForm(
                      returnOrderItemController: returnOrderItemController),
                  defaultSpacerSmall,
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding * .5),
                    child: Column(
                      children: [
                        const DefaultTitleWithStyle(
                          title: "Images",
                        ),
                        const SizedBox(
                          height: defaultPadding * .3,
                        ),
                        UploadImageSection(
                            orderReturnController: returnOrderItemController),
                        defaultSpacer,
                        DefaultButton(
                          text: "Submit",
                          onPressed: () {
                            returnOrderItemController.returnOrder();
                          },
                          isLoading: returnOrderItemController.buttonLoading,
                          elevation: 0,
                        ),
                        defaultSpacer,
                      ],
                    ),
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
