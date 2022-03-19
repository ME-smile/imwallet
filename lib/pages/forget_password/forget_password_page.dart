import 'package:dc_flutter_cli/components/app_text_field/app_password_text_field.dart';
import 'package:dc_flutter_cli/components/app_text_field/app_phone_field.dart';
import 'package:dc_flutter_cli/components/app_text_field/app_sms_text_field.dart';
import 'package:dc_flutter_cli/pages/forget_password/forget_password_controller.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocaleKey.setPassword.name.tr),
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              Text(
                AppLocaleKey.phoneNumber.name.tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
              AppPhoneTextField(),
              Gap(18),
              Text(
                AppLocaleKey.SmsCode.name.tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
              AppSmsTextField(),
              Gap(18),
              Text(
                AppLocaleKey.SmsCode.name.tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
              AppPasswordTextField(
                hintText: AppLocaleKey.inputNewPasswordHint.name.tr,
              ),
              Gap(18),
              Text(
                AppLocaleKey.SmsCode.name.tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
              AppPasswordTextField(
                hintText: AppLocaleKey.confirmPasswordHint.name.tr,
              ),
            ],
          ),
        )),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              left: 18,
              right: 18,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                AppLocaleKey.confirmSetPassword.name.tr,
              ),
            ),
          ),
        ),
      );
    });
  }
}
