import 'package:flutter_svg/svg.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/widgets/default_text.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({
    this.street,
    this.address,
    this.phone,
    Key? key,
  }) : super(key: key);
  final String? street;
  final String? address;
  final String? phone;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(defaultPadding * .5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TitleWithButton(
              //   title: AppLocalizations.of(context)!.delivery_address,
              //   onTap: () {
              //     Get.toNamed(RouteList.myAddress, arguments: "changeAddress");
              //   },
              //   buttonText: AppLocalizations.of(context)!.change,
              //   isButton: true,
              // ),
              // defaultSpacerSmall,
              Row(
                children: [
                  Expanded(
                    child: DefaultText(
                      title: street ?? "",
                      fontSize: defaultPadding * .7,
                      isBold: true,
                    ),
                  ),
                  defaultSpacerHorizontalSmall,
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteList.myAddress,
                            arguments: "changeAddress");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(defaultPadding * .1),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            DefaultText(
                              title: AppLocalizations.of(context)!.change,
                              color: primaryColor,
                              isBold: true,
                            ),
                            const SizedBox(
                              width: defaultPadding * .2,
                            ),
                            SvgPicture.asset("assets/svgs/change.svg")
                          ],
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: defaultPadding * .2,
              ),
              DefaultText(
                title: address ?? "",
                fontSize: defaultPadding * .7,
              ),
              const SizedBox(
                height: defaultPadding * .2,
              ),
              DefaultText(
                title: phone ?? "",
                fontSize: defaultPadding * .7,
                isBold: true,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.onTap,
    this.isButton = false,
  }) : super(key: key);

  final String title;
  final String buttonText;
  final VoidCallback onTap;
  final bool isButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        if (isButton)
          GestureDetector(
            onTap: onTap,
            child: Text(
              buttonText,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: primaryColor),
            ),
          ),
      ],
    );
  }
}
