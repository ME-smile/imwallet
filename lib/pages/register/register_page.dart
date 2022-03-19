import 'package:dc_flutter_cli/components/app_text_field/app_password_text_field.dart';
import 'package:dc_flutter_cli/components/app_text_field/app_phone_field.dart';
import 'package:dc_flutter_cli/components/app_text_field/app_sms_text_field.dart';
import 'package:dc_flutter_cli/components/app_text_field/app_text_field.dart';
import 'package:dc_flutter_cli/pages/register/register_controller.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text(AppLocaleKey.register.name.tr)),
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
                Gap(5),
                AppPhoneTextField(
                  onChanged: _.setPhoneNumber,
                ),
                Gap(18),
                Text(
                  AppLocaleKey.inputPasswordLabel.name.tr,
                  style: Get.theme.textTheme.bodyMedium,
                ),
                Gap(12),
                Text(
                  AppLocaleKey.inputPasswordTip.name.tr,
                  style: Get.theme.textTheme.labelSmall,
                ),
                AppPasswordTextField(
                  onChanged: _.setPassword,
                ),
                AppPasswordTextField(
                  onChanged: _.setConfirmPassword,
                  hintText: AppLocaleKey.confirmPasswordHint.name.tr,
                ),
                Gap(18),
                Text(
                  AppLocaleKey.inputInvitationCodeLabel.name.tr,
                  style: Get.theme.textTheme.bodyMedium,
                ),
                AppTextField(
                  hintText: AppLocaleKey.inputInvitationCodeLabel.name.tr,
                  onChanged: _.setInvitationCode,
                ),
                Gap(18),
                Text(
                  AppLocaleKey.inputSMSCodeLabel.name.tr,
                  style: Get.theme.textTheme.bodyMedium,
                ),
                AppSmsTextField(
                  onChanged: _.setSmsCode,
                ),
                Gap(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(R.icon.checkBox),
                    Gap(4),
                    Text(
                      AppLocaleKey.pravicyTip.name.tr,
                      style: Get.textTheme.labelSmall,
                    )
                  ],
                ),
                Gap(10),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    AppLocaleKey.agreeItemTip.name.tr,
                    style: Get.textTheme.labelSmall,
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              left: 18,
              right: 18,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                AppLocaleKey.register.name.tr,
              ),
            ),
          ),
        ),
      );
    });
  }
}
