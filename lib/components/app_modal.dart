import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<T?> showAppModalPopup<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  ImageFilter? filter,
  double? maxHeight,
  Color barrierColor = kCupertinoModalBarrierColor,
  bool barrierDismissible = false,
  bool useRootNavigator = true,
  bool? semanticsDismissible,
  RouteSettings? routeSettings,
  AppBar? appBar,
  Widget? bottomNavigationBar,
}) {
  return showCupertinoModalPopup<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return Material(
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Container(
            alignment: Alignment.topCenter,
            width: Get.width,
            constraints: BoxConstraints(
              maxHeight: maxHeight ?? Get.height * .8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF545454),
            ),
            child: Builder(builder: builder),
          ),
        ),
      );
    },
  );
}
