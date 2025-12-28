import 'package:flutter_svg/svg.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/widgets/search_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/screen/search_screen/search_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';

import '../../widgets/default_appbar.dart';
import 'components/search_section.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchScreenController searchScreenController = Get.find();
    searchScreenController.getData();
    return AnimatedBuilder(
      animation: searchScreenController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: const DefaultAppBar(
              isBack: false,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight * 1.3),
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding * .3),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: SvgPicture.asset("assets/svgs/arrow_left.svg")),
                    Expanded(
                      child: SearchSection(
                        searchScreenController: searchScreenController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: searchScreenController.searchController.text.length > 3 &&
                  searchScreenController.productList.isEmpty
              ? Center(
                  child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                    ),
                    Center(
                      child: Image.asset(
                        "assets/gif/empty_search.gif",
                        width: defaultPadding * 10,
                        fit: BoxFit.cover,
                      ),
                    ),
                    defaultSpacer,
                    Text(
                      AppLocalizations.of(context)!.no_item_found,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: blackColor.withOpacity(.7),
                          fontSize: defaultPadding * .8),
                    ),
                  ],
                ))
              : SearchGridView(
                  product: searchScreenController.productList,
                  isLoadingMore: searchScreenController.isLoadingMore,
                  moreItemsAvailable: searchScreenController.moreItemsAvailable,
                  scrollController: searchScreenController.scrollController),
        );
      },
    );
  }
}
