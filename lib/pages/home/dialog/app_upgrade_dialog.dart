import 'package:dc_flutter_cli/components/app_button.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AppUpgradeDialog extends StatelessWidget {
  const AppUpgradeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Dialog(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 52),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(0, -68),
                  child: Column(
                    children: [Image.asset(R.icon.rocket), Text('检测到最新版本')],
                  ),
                ),
                AppButton(
                  height: 32,
                  onTap: () {},
                  text: '立即更新',
                ),
                Gap(28),
              ],
            ),
          ),
        ),
        onWillPop: () {
          return Future.value(false);
        });
  }
}

Future showAppUpgradeDialog() {
  return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AppUpgradeDialog();
      });
}
