import 'package:savomart/presentation/widgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/screen/home_screen/home_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/custom_slider_home.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';
import 'components/home_category.dart';
import 'components/home_products.dart';
import 'components/home_search_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.find();
    homeScreenController.getData();
    return AnimatedBuilder(
      animation: homeScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: DefaultAppBar()),
          // drawer: const NavDrawer(),
          body: NetworkResource(
            appError: homeScreenController.appError,
            loading: homeScreenController.isLoading,
            retry: () => homeScreenController.retry(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding * .5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeSearchSection(),
                    defaultSpacerSmall,
                    CustomCarouselHomePage(
                        items: homeScreenController.bannerItems),
                    defaultSpacerSmall,
                    HomeCategory(homeScreenController: homeScreenController),
                    defaultSpacerSmall,
                    Divider(
                      thickness: defaultPadding * .15,
                      color: primaryColor.withOpacity(.05),
                    ),
                    defaultSpacerSmall,
                    HomeProducts(
                      homeScreenController: homeScreenController,
                    ),
                    // defaultSpacer,
                    // RecentlyViewedProducts(homeScreenController: homeScreenController),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
