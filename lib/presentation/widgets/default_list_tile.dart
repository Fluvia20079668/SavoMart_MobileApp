import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter_svg/svg.dart';

class DefaultListTile extends StatelessWidget {
  const DefaultListTile(
      {Key? key,
      this.leading,
      this.trailing = Icons.keyboard_arrow_right,
      required this.title,
      required this.onTap,
      this.isShowArrow = true,
      this.color = whiteColor,
      this.assetName,
      this.iconColor})
      : super(key: key);

  final IconData? leading;
  final IconData trailing;
  final String title;
  final VoidCallback onTap;
  final bool isShowArrow;
  final Color color;
  final String? assetName;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: assetName != null
          ? SvgPicture.asset(
              assetName!,
              color: primaryColor,
            )
          : Icon(
              leading,
              color: blackColor,
            ),
      dense: isShowArrow ? false : true,
      minLeadingWidth: defaultPadding * .1,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.bold, color: blackColor),
      ),
      trailing: isShowArrow
          ? Icon(
              trailing,
              color: blackColor,
            )
          : const SizedBox.shrink(),
    );
  }
}
