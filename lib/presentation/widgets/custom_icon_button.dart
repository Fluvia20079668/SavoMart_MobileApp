import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.iconData,
    required this.onTap,
    this.iconColor = blackColor,
    this.backgroundColor = scaffoldBg,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback onTap;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultPadding * 1.5,
      height: defaultPadding * 1.5,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
          onTap: onTap,
          child: Icon(
            iconData,
            color: iconColor,
            size: defaultPadding*.9,
          )),
    );
  }
}
