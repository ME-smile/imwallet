import 'package:dc_flutter_cli/utils/toast_util.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color? backgroupColor;
  final Color? foregroundColor;
  final double height;
  final bool isSecondary;
  final bool loading;
  final TextStyle? textStyle;
  final double? width;
  final bool isDisabled;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const AppButton({
    this.width,
    this.height = 36,
    required this.text,
    required this.onTap,
    this.isDisabled = false,
    this.isSecondary = false,
    this.loading = true,
    this.textStyle,
    this.foregroundColor,
    this.backgroupColor,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      height: height,
      padding: padding,
      margin: margin,
      // alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: isDisabled
            ? null
            : () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (onTap is Future Function() && loading) {
                  ToastUtil.loading();
                  onTap().whenComplete(() {
                    ToastUtil.dismiss();
                  });
                } else {
                  onTap();
                }
              },
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStateProperty.all(backgroupColor ??
                  (isSecondary
                      ? Theme.of(context).buttonTheme.colorScheme?.secondary
                      : null)),
              foregroundColor: MaterialStateProperty.all(foregroundColor ??
                  ((isSecondary
                      ? Theme.of(context).buttonTheme.colorScheme?.onSecondary
                      : null))),
              textStyle: MaterialStateProperty.all(textStyle),
            ),
        child: Text('${text}'),
      ),
    );
  }
}
