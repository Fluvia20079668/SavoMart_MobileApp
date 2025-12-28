import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultGradiantIconButton extends StatelessWidget {
  const DefaultGradiantIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: defaultPadding * 1.5,
        width: defaultPadding * 1.5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: defaultGradiant,
            borderRadius: BorderRadius.circular(defaultPadding * .25)),
        child: Icon(
          icon,
          color: whiteColor,
          size: defaultPadding * .9,
        ),
      ),
    );
  }
}
