import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/search_screen/search_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter_svg/svg.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    Key? key,
    required this.searchScreenController,
  }) : super(key: key);

  final SearchScreenController searchScreenController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kToolbarHeight),
        child: TextField(
          controller: searchScreenController.searchController,
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
              hintText: AppLocalizations.of(context)!.search,
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  searchScreenController.searchController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            searchScreenController.clearSearch();
                          },
                          icon: SvgPicture.asset(
                            "assets/svgs/ic_close.svg",
                          ))
                      : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding*.5),
                        child: SvgPicture.asset("assets/svgs/search_arrow.svg"),
                      ),
                ],
              ),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: defaultPadding * .7, color: blackColor),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding * .3),
                  borderSide: const BorderSide(color: productBg)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding * .3),
                  borderSide: const BorderSide(color: productBg)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding * .3),
                  borderSide: const BorderSide(color: productBg)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding * .3),
                  borderSide: const BorderSide(color: productBg)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding * .3),
                  borderSide: const BorderSide(color: productBg)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding * .3),
                  borderSide: const BorderSide(color: productBg))),
          textInputAction: TextInputAction.search,
          onSubmitted: (val) {
            searchScreenController.submitSearch(val);
          },
          onChanged: (val) {
            searchScreenController.submitSearch(val);
          },
        ),
      ),
    );
  }
}
