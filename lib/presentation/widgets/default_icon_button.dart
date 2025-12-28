import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultIconButton extends StatelessWidget {
  const DefaultIconButton({
    Key? key,
    required this.onTap,
    required this.iconUrl,
    this.iconColor,
    this.iconSize
  }) : super(key: key);

  final VoidCallback onTap;
  final String iconUrl;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        iconUrl,
        color: iconColor,
        width: iconSize,
      ),
    );
  }
}
