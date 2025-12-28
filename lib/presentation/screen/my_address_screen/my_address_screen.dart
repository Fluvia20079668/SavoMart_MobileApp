import 'package:savomart/domain/params/address_params.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/my_address_screen/my_address_screen_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_icon_button.dart';
import 'package:savomart/presentation/widgets/network_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyAddressController myAddressController = Get.find();
    myAddressController.getData();
    return AnimatedBuilder(
      animation: myAddressController,
      builder: (BuildContext context, Widget? child) {
        return NetworkResource(
          appError: myAddressController.appError,
          loading: myAddressController.isLoading,
          retry: () => myAddressController.retry(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.my_address,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding * .5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () => Get.toNamed(RouteList.addAddressScreen,
                            arguments:
                                const ChangeAddressParam(from: 'addnew')),
                        child: Text(
                          AppLocalizations.of(context)!.add_address,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: primaryColor,
                                  fontSize: defaultPadding * .7,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold),
                        )),
                    myAddressController.addressList!.isNotEmpty
                        ? Column(
                            children: [
                              ...List.generate(
                                  myAddressController.addressList!.length,
                                  (index) => Card(
                                        color: whiteColor,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: myAddressController
                                                            .arg ==
                                                        "changeAddress"
                                                    ? myAddressController
                                                            .addressList![index]
                                                            .isSelected
                                                        ? primaryColor
                                                        : whiteColor
                                                    : whiteColor,
                                                width: defaultPadding * .1),
                                            borderRadius: BorderRadius.circular(
                                                defaultPadding * .5)),
                                        child: ListTile(
                                          onTap: () {
                                            if (myAddressController.arg ==
                                                "changeAddress") {
                                              myAddressController.selectAddress(
                                                  myAddressController
                                                      .addressList![index].id);
                                            }
                                          },
                                          minVerticalPadding:
                                              defaultPadding * .7,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      defaultPadding * .5)),
                                          title: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  myAddressController
                                                          .addressList![index]
                                                          .street ??
                                                      "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: blackColor,
                                                      ),
                                                ),
                                              ),
                                              if (myAddressController.arg !=
                                                  "changeAddress")
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    // ActionButtons(
                                                    //   iconImage: Icons.edit,
                                                    //   onTap: () {
                                                    //     Get.toNamed(
                                                    //         RouteList
                                                    //             .addAddressScreen,
                                                    //         arguments: ChangeAddressParam(
                                                    //             addressParams: AddressParams(
                                                    //                 addressId: myAddressController
                                                    //                     .addressList![
                                                    //                         index]
                                                    //                     .id
                                                    //                     .toString(),
                                                    //                 address: myAddressController
                                                    //                     .addressList![
                                                    //                         index]
                                                    //                     .addressLine1,
                                                    //                 street: myAddressController
                                                    //                     .addressList![
                                                    //                         index]
                                                    //                     .street,
                                                    //                 phone: myAddressController
                                                    //                     .addressList![
                                                    //                         index]
                                                    //                     .number)));
                                                    //   },
                                                    // ),
                                                    DefaultIconButton(
                                                        onTap: () {
                                                          Get.toNamed(
                                                              RouteList
                                                                  .addAddressScreen,
                                                              arguments: ChangeAddressParam(
                                                                  addressParams: AddressParams(
                                                                      addressId: myAddressController
                                                                          .addressList![
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                      address: myAddressController
                                                                          .addressList![
                                                                              index]
                                                                          .addressLine1,
                                                                      street: myAddressController
                                                                          .addressList![
                                                                              index]
                                                                          .street,
                                                                      phone: myAddressController
                                                                          .addressList![
                                                                              index]
                                                                          .number)));
                                                        },
                                                        iconUrl:
                                                            'assets/svgs/edit.svg'),
                                                    defaultSpacerHorizontal,
                                                    // ActionButtons(
                                                    //   iconImage: Icons.delete,
                                                    //   onTap: () {
                                                    //     myAddressController
                                                    //         .deleteAddress(
                                                    //             myAddressController
                                                    //                 .addressList![
                                                    //                     index]
                                                    //                 .id);
                                                    //   },
                                                    // ),
                                                    DefaultIconButton(
                                                        onTap: () {
                                                          myAddressController
                                                              .deleteAddress(
                                                                  myAddressController
                                                                      .addressList![
                                                                          index]
                                                                      .id);
                                                        },
                                                        iconUrl:
                                                            'assets/svgs/delete.svg')
                                                  ],
                                                ),
                                            ],
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              defaultSpacerSmall,
                                              Text(myAddressController
                                                      .addressList![index]
                                                      .addressLine1 ??
                                                  ""),
                                              defaultSpacerSmall,
                                              Text(
                                                  "${myAddressController.addressList![index].number ?? ""}"),
                                            ],
                                          ),
                                          // leading:
                                          //     myAddressController.arg == "changeAddress"
                                          //         ? Radio<bool>(
                                          //             value: true,
                                          //             groupValue: myAddressController
                                          //                 .addressList![index]
                                          //                 .isSelected,
                                          //             onChanged: (value) {},
                                          //           )
                                          //         : null,
                                        ),
                                      ))
                            ],
                          )
                        : const Text(''),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
