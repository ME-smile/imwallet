import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Function() onTap;
  final Color backgroupColor;
  final Color textColor;
  final double height;
  final bool isDisabled;
  final bool isSecondary;
  final bool showLoading;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Widget? child;
  final double? width;
  const AppButton({
    this.width,
    this.height = 36,
    this.text,
    required this.onTap,
    this.isDisabled = false,
    this.isSecondary = false,
    this.showLoading = true,
    this.textStyle,
    this.child,
    this.borderColor,
  })  : backgroupColor = isSecondary ? Colors.transparent : Colors.white,
        textColor = isSecondary ? Colors.white : const Color(0xFF171717),
        assert(child == null || text == null, 'child and text');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        // if (isDisabled) return;
        // if (onTap is Future Function() && showLoading) {
        //   UIHelper.showLoading();
        //   onTap().whenComplete(() {
        //     UIHelper.dismiss();
        //   });
        // } else {
        //   onTap();
        // }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: isDisabled ? backgroupColor.withOpacity(.3) : backgroupColor,
            border: Border.all(
              color: borderColor ??
                  (isSecondary
                      ? const Color(0xFF666666)
                      : isDisabled
                          ? Colors.transparent
                          : Colors.white),
            )
            // color: borderColor ??
            //     (isDisabled ? Colors.transparent : Colors.white)),
            ),
        alignment: Alignment.center,
        child: child ??
            Text(
              '${text?.toUpperCase()}',
              style: textStyle,
            ),
      ),
    );
  }
}
