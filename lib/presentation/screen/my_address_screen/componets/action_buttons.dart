import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.iconImage,
    required this.onTap,
  });

  final IconData iconImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        iconImage,
        size: defaultPadding * .8,
        color: blackColor,
      ),
    );
  }
}
