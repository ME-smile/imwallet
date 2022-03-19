import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSmsTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  const AppSmsTextField({
    Key? key,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      focusNode: focusNode,
      keyboardType: TextInputType.visiblePassword,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: AppLocaleKey.inputSMSCodeLabel.name.tr,
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Text(
            AppLocaleKey.getSMS.name.tr,
            style: TextStyle(
              color: Get.theme.accentColor,
              fontSize: 12,
            ),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: R.color.enabledInputDecorationBorder, width: .5)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: R.color.focusdInputDecorationBorder, width: .5)),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
              color: R.color.enabledInputDecorationBorder, width: .5),
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 18,
          minWidth: 18,
        ),
      ),
    );
  }
}
