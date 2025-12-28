import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:savomart/presentation/theme/theme.dart';

class DefaultSearchBox extends StatelessWidget {
  const DefaultSearchBox({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.borderRadius = defaultPadding * .3,
    this.readOnly = false,
    this.onTap,
    this.onClearSearch,
    this.onChange,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final double borderRadius;
  final bool readOnly;
  final Function(String)? onTap;
  final VoidCallback? onClearSearch;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: TextInputType.text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: defaultPadding * .7, color: blackColor),
      // onTap: onTap,
      readOnly: readOnly,
      onChanged: (value) {
        onChange!(value);
      },
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        onTap!(value);
      },
      decoration: InputDecoration(
          isDense: true,
          fillColor: productBg,
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svgs/search.svg",
              ),
            ],
          ),
          suffixIcon: textEditingController.text.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: onClearSearch,
                        icon: SvgPicture.asset(
                          "assets/svgs/ic_close.svg",
                        )),
                  ],
                )
              : null,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: defaultPadding * .7, color: blackColor),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: productBg)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: productBg)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: productBg)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: productBg)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: productBg)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: productBg))),
    );
  }
}
