import 'package:animations/animations.dart';
import 'package:savomart/presentation/screen/my_account/my_account_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';

import '../../../widgets/default_back_button.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    required this.myaccountController,
  }) : super(key: key);

  final MyaccountController myaccountController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomRight,
        children: [
          myaccountController.profileNetworkImages != null
              ? OpenContainer(
                  closedColor: whiteColor,
                  closedElevation: 0,
                  closedBuilder:
                      (BuildContext context, void Function() action) {
                    return Container(
                      width: defaultPadding * 5,
                      height: defaultPadding * 5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              myaccountController.profileNetworkImages!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(defaultPadding * 2.5)),
                        border: Border.all(
                          color: greyColorLight,
                          width: defaultPadding * .3,
                        ),
                      ),
                    );
                  },
                  openBuilder: (BuildContext context,
                      void Function({Object? returnValue}) action) {
                    return Scaffold(
                      body: Stack(
                        children: [
                          PhotoView(
                            imageProvider: NetworkImage(
                                myaccountController.profileNetworkImages!),
                          ),
                          const Positioned(
                              top: kTextTabBarHeight,
                              left: defaultPadding,
                              child: DefaultBackButton())
                        ],
                      ),
                    );
                  },
                )
              : const CircleAvatar(
                  radius: defaultPadding * 2.5,
                  backgroundImage: AssetImage("assets/empty_avatar.png"),
                  backgroundColor: Colors.transparent,
                ),
          Container(
            width: defaultPadding * 1.3,
            height: defaultPadding * 1.3,
            decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(defaultPadding * .2)),
            child: GestureDetector(
                onTap: myaccountController.addProfileImage,
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding * .25),
                  child: SvgPicture.asset(
                    'assets/svgs/pencil.svg',
                    // ignore: deprecated_member_use
                    color: whiteColor,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
