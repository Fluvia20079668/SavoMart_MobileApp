import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:savomart/domain/params/cms_args.dart';
import 'package:savomart/presentation/screen/cms_screen/cms_controller.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';

import '../../theme/theme.dart';

class CMSScreen extends StatelessWidget {
  const CMSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CMSController cmsController = Get.find();
    cmsController.getData();
    CMSArgs cmsArgs = Get.arguments;
    return AnimatedBuilder(
      animation: cmsController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: whiteColor,
          extendBodyBehindAppBar: cmsController.isLoading ? true : false,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              cmsArgs.cmsTitle,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold, fontSize: defaultPadding),
            ),
            backgroundColor: whiteColor,
          ),
          body: NetworkResource(
            appError: cmsController.appError,
            loading: cmsController.isLoading,
            retry: () {
              cmsController.retry();
            },
            bgColor: whiteColor,
            child: Html(
              data: cmsController.cmsSection,
            ),
          ),
        );
      },
    );
  }
}
