import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/theme.dart';

class CartUpdateIcon extends StatelessWidget {
  const CartUpdateIcon({
    super.key,
    required this.iconUrl,
    required this.onTap,
  });

  final String iconUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: Colors.transparent,
          width: defaultPadding,
          height: defaultPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconUrl),
            ],
          )),
    );
  }
}
