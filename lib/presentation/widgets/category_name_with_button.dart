import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';

import 'header_with_padding.dart';

class CategoryNamewithButton extends StatelessWidget {
  const CategoryNamewithButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.buttonText,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeaderWithPadding(
          text: text,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            buttonText,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: primaryColor,fontWeight:FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
