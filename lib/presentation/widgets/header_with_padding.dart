import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_text.dart';

class HeaderWithPadding extends StatelessWidget {
  const HeaderWithPadding({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      title: text,
      isBold: true,
      fontSize: defaultPadding * .8,
      color: textColor,
    );
  }
}
