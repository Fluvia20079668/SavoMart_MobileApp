import 'package:flutter_svg/flutter_svg.dart';
import 'package:savomart/l10n/app_localizations.dart';
import 'package:savomart/presentation/screen/my_account/my_account_controller.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/formaters.dart';
import '../../widgets/default_text.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyaccountController myaccountController = Get.find();
    myaccountController.getData();
    return AnimatedBuilder(
      animation: myaccountController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            backgroundColor: whiteColor,
            titleSpacing: 0,
            centerTitle: false,
            title: Text(
              AppLocalizations.of(context)!.profile,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: defaultPadding,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding * .6),
              child: Column(
                children: [
                  // ProfilePicture(
                  //   myaccountController: myaccountController,
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width * .25,
                    height: MediaQuery.of(context).size.width * .25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: scaffoldBg,
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * .2,
                      ),
                    ),
                    child: DefaultText(
                      title: firstLetter(
                        myaccountController.nameController.text,
                      ),
                      fontSize: defaultPadding * 2.5,
                      isBold: true,
                      color: primaryColor.withOpacity(.5),
                    ),
                  ),
                  defaultSpacer,
                  defaultSpacer,
                  Form(
                    key: myaccountController.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: myaccountController.nameController,
                          validator: (value) {
                            return value!.isEmpty
                                ? AppLocalizations.of(
                                    context,
                                  )!.please_enter_name
                                : null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.name,
                            isDense: true,
                            filled: true,
                            fillColor: greyColor.withOpacity(.1),
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/svgs/user_name.svg",
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        defaultSpacer,
                        TextFormField(
                          controller: myaccountController.phoneController,
                          validator: (value) {
                            return value!.isEmpty
                                ? AppLocalizations.of(
                                    context,
                                  )!.please_enter_phone
                                : null;
                          },
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(
                              context,
                            )!.phone_number,
                            isDense: true,
                            filled: true,
                            fillColor: greyColor.withOpacity(.1),
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/svgs/phone.svg",
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        defaultSpacer,
                        TextFormField(
                          controller: myaccountController.emailController,
                          validator: (value) {
                            return value!.isEmpty
                                ? AppLocalizations.of(
                                    context,
                                  )!.please_enter_email
                                : !emailChecking(value)
                                ? AppLocalizations.of(
                                    context,
                                  )!.please_enter_valid_email
                                : null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.email,
                            isDense: true,
                            filled: true,
                            fillColor: greyColor.withOpacity(.1),
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/svgs/mail.svg",
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: kToolbarHeight * .5),
                  DefaultButton(
                    text: AppLocalizations.of(context)!.submit,
                    elevation: 0,
                    backgroundColor: primaryColorDark,
                    onPressed: myaccountController.updateProfile,
                    isLoading: myaccountController.buttonLoading,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
