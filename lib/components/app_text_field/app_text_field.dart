import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String hintText;
  const AppTextField({
    Key? key,
    this.onChanged,
    this.onFieldSubmitted,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: R.color.enabledInputDecorationBorder, width: .5)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: R.color.focusdInputDecorationBorder, width: .5)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: R.color.enabledInputDecorationBorder, width: .5))),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
