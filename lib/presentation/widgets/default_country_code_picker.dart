import 'package:country_code_picker/country_code_picker.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultCountryCodePicker extends StatelessWidget {
  const DefaultCountryCodePicker({
    Key? key,
    required this.initalSelection,
    required this.onChange,
  }) : super(key: key);

  final String initalSelection;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      child: CountryCodePicker(
        
        initialSelection: initalSelection,
        showFlag: false,
        showFlagDialog: false,
        alignLeft: true,
        dialogBackgroundColor: scaffoldBg,
        padding: const EdgeInsets.all(0),
        dialogSize: Size(MediaQuery.of(context).size.width - 50,
            MediaQuery.of(context).size.height - 100),
      ),
    );
  }
}
