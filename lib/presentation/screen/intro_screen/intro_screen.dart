import 'package:savomart/domain/entities/onboarding_entity.dart';
import 'package:savomart/presentation/screen/intro_screen/intro_screen_controller.dart';

import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_background_image.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IntroScreenController introScreenController = Get.find();
    return AnimatedBuilder(
      animation: introScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Stack(
            children: [
              const DefaultBackGroundImage(bgUrl: 'assets/bg_splash.png'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding * 1.5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(flex: 2),
                    Image.asset(
                      "assets/logo.png",
                      width: MediaQuery.of(context).size.width * .3,
                      fit: BoxFit.contain,
                    ),
                    const Spacer(flex: 2),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding * 1.5,
                      ),
                      decoration: BoxDecoration(
                        color: blackColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(defaultPadding),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Fresh Groceries, Made Easy',
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(
                                  fontSize: defaultPadding * 1.2,
                                  color: blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: defaultPadding),
                          Text(
                            'Order daily grocery items from your phone and get them delivered quickly and conveniently to your doorstep.',
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(
                                  fontSize: defaultPadding * .7,
                                  color: blackColor,
                                  fontWeight: FontWeight.normal,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                    DefaultButton(
                      borderRadius: defaultPadding * 5,
                      text: "Get Started",
                      elevation: 0,
                      onPressed: () => introScreenController.saveIntro(
                        const OnBoardEntity(isIntro: true),
                      ),
                      isLoading: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
