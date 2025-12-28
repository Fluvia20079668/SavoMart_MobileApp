import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logo",
      child: Image.asset(
        "assets/logo.png",
        width: MediaQuery.of(context).size.width * .6,
      ),
    );
  }
}
