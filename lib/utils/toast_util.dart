/*
 * @Description: 弹窗
 * @Author: iamsmiling
 * @Date: 2021-09-18 14:52:54
 * @LastEditTime: 2021-09-18 14:54:06
 */
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

abstract class ToastUtil {
  static void loading() {
    BotToast.showCustomLoading(toastBuilder: (CancelFunc cancelFunc) {
      return Container(
        width: 72,
        height: 72,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.black87),
        child: Image.asset(
          '',
          width: 48,
          height: 48,
        ),
      );
    });
  }

  static void dismiss() {
    BotToast.closeAllLoading();
  }

  static void toast(String message) {
    BotToast.showText(text: message);
  }

  static void error(String text,
      {Duration duration = const Duration(seconds: 2),
      Alignment alignment = Alignment.topCenter}) {
    BotToast.showSimpleNotification(
      title: text,
      align: alignment,
      duration: duration,
      dismissDirections: [DismissDirection.down, DismissDirection.horizontal],
      wrapToastAnimation: (controller, onClose, child) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Opacity(opacity: controller.value, child: child);
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 56,
              left: 12,
              right: 12,
            ),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFFE23F3F),
            ),
            child:
                Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        );
      },
    );
  }

  static void success(String text,
      {Duration duration = const Duration(seconds: 2),
      Alignment alignment = Alignment.topCenter}) {
    BotToast.showSimpleNotification(
      title: text,
      align: alignment,
      duration: duration,
      dismissDirections: [DismissDirection.down, DismissDirection.horizontal],
      wrapToastAnimation: (controller, onClose, child) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Opacity(opacity: controller.value, child: child);
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 56,
              left: 12,
              right: 12,
            ),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF65B84A),
            ),
            child:
                Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        );
      },
    );
  }
}
