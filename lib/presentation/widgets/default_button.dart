import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:savomart/presentation/widgets/default_text.dart';

import 'loading_widget.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.isLoading,
      this.backgroundColor = primaryColorDark,
      this.textColor = whiteColor,
      this.height = defaultPadding * 3,
      this.borderRadius = defaultPadding * .5,
      this.isIcon = false,
      this.imageUrl,
      this.elevation = 0,
      this.isBold = true,
      this.textSize = defaultPadding * .7})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;
  final bool isIcon;
  final String? imageUrl;
  final double elevation;
  final bool isBold;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
          height: height,
          child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(elevation),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)),
                ),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
              ),
              onPressed: isLoading ? () {} : onPressed,
              child: AnimatedSwitcher(
                duration: defaultAnimationDuration,
                child: isLoading
                    ? LoadingWidget(color: textColor)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isIcon)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  imageUrl!,
                                ),
                                defaultSpacerHorizontalSmall
                              ],
                            ),
                          DefaultText(
                            title: text,
                            color: textColor,
                            isBold: isBold,
                            fontSize: textSize,
                          )
                        ],
                      ),
              )),
        )),
      ],
    );
  }
}

class DefaultButtonRounded extends StatelessWidget {
  const DefaultButtonRounded({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.backgroundColor = primaryColor,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultPadding))),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        onPressed: isLoading ? () {} : onPressed,
        child: AnimatedSwitcher(
          duration: defaultAnimationDuration,
          child: isLoading
              ? const LoadingWidget()
              : Text(
                  text,
                ),
        ));
  }
}

class DefaultGradiantButtonRounded extends StatelessWidget {
  const DefaultGradiantButtonRounded({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.backgroundColor = defaultGradiant,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Gradient backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? () {} : onPressed,
      child: Container(
        alignment: Alignment.center,
        height: defaultPadding * 3,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding * 4),
            gradient: backgroundColor),
        padding: const EdgeInsets.all(0),
        child: AnimatedSwitcher(
          duration: defaultAnimationDuration,
          child: isLoading
              ? const LoadingWidget()
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: whiteColor),
                ),
        ),
      ),
    );
  }
}
