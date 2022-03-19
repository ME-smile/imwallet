import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AppPhoneTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  const AppPhoneTextField({
    Key? key,
    this.onChanged,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: AppLocaleKey.inputPhoneNumber.name.tr,
          prefixIcon: Container(
            width: 68,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '+86',
                  style: Get.theme.textTheme.bodySmall,
                ),
                Gap(12),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                  size: 16,
                )
              ],
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
                  color: R.color.enabledInputDecorationBorder, width: .5))),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
