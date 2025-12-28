import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../../widgets/default_title_with_text.dart';
import '../return_order_item_controller.dart';

class OrderRetunForm extends StatelessWidget {
  const OrderRetunForm({
    super.key,
    required this.returnOrderItemController,
  });

  final ReturnOrderItemController returnOrderItemController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding * .5),
      child: Form(
        key: returnOrderItemController.returnOrderFormKey,
        child: Column(
          children: [
            const DefaultTitleWithStyle(
              title: "Location",
            ),
            const SizedBox(
              height: defaultPadding * .3,
            ),
            TextFormField(
              controller: returnOrderItemController.locationController,
              keyboardType: TextInputType.name,
              style: Theme.of(context).textTheme.titleSmall,
              validator: (value) {
                return value!.isEmpty ? "Enter location" : null;
              },
              decoration: const InputDecoration(
                hintText: "Enter location",
              ),
            ),
            defaultSpacer,
            const DefaultTitleWithStyle(
              title: "Return Reason",
            ),
            const SizedBox(
              height: defaultPadding * .3,
            ),
            TextFormField(
              controller: returnOrderItemController.returnReasonController,
              keyboardType: TextInputType.name,
              style: Theme.of(context).textTheme.titleSmall,
              maxLines: 4,
              validator: (value) {
                return value!.isEmpty ? "Enter return reason" : null;
              },
              decoration: const InputDecoration(
                hintText: "Enter reason",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
