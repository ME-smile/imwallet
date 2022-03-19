import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class AppPasswordTextField extends HookWidget {
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String? hintText;
  const AppPasswordTextField({
    Key? key,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isCypher = useState(true);
    return TextFormField(
      onChanged: onChanged,
      focusNode: focusNode,
      keyboardType: TextInputType.visiblePassword,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: isCypher.value,
      decoration: InputDecoration(
        hintText: hintText ?? AppLocaleKey.inputPassword.name.tr,
        suffixIcon: GestureDetector(
          onTap: () {
            isCypher.value = !isCypher.value;
          },
          child: Image.asset(isCypher.value ? R.icon.eyeClose : R.icon.eyeOpen),
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
