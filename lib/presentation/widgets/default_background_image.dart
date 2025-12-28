import 'package:flutter/material.dart';

class DefaultBackGroundImage extends StatelessWidget {
  const DefaultBackGroundImage({
    Key? key,
    required this.bgUrl,
  }) : super(key: key);

  final String bgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
