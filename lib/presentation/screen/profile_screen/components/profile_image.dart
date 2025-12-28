import 'package:savomart/presentation/screen/profile_screen/profile_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.profileScreenController,
  }) : super(key: key);

  final ProfileScreenController profileScreenController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        profileScreenController.profileNetworkImages != null
            ? Container(
                width: defaultPadding * 5,
                height: defaultPadding * 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        profileScreenController.profileNetworkImages!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(defaultPadding * 2.5)),
                  border: Border.all(
                    color: greyColorLight,
                    width: defaultPadding * .3,
                  ),
                ),
              )
            : const CircleAvatar(
                radius: defaultPadding * 2.5,
                backgroundImage: AssetImage("assets/empty_avatar.png"),
                backgroundColor: Colors.transparent,
              ),
      ],
    );
  }
}
