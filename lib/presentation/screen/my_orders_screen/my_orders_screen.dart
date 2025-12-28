import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/my_orders_screen/my_order_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/my_order_item.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyorderController myorderController = Get.find();
    myorderController.getData();
    return AnimatedBuilder(
      animation: myorderController,
      builder: (BuildContext context, Widget? child) {
        return NetworkResource(
          appError: myorderController.appError,
          loading: myorderController.isLoading,
          retry: () => myorderController.retry(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.my_orders,
                style: Theme.of(context)
                    .textTheme
                    // ignore: deprecated_member_use
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding * .5),
                child: myorderController.orderList.isNotEmpty
                    ? Column(
                        children: [
                          ...List.generate(
                            myorderController.orderList.length,
                            (index) => MyOrderItem(
                                order: myorderController.orderList[index]),
                          ),
                          defaultSpacer
                        ],
                      )
                    : Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .22,
                            ),
                            Image.asset(
                              "assets/ic_no_order.png",
                              height: 130,
                              width: 120,
                            ),
                            defaultSpacer,
                            Text(AppLocalizations.of(context)!.no_order_found),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
