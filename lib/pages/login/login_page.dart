/*
 * @Description: 登录页面
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:24:52
 * @LastEditTime: 2022-02-07 17:08:33
 */
import 'package:dc_flutter_cli/components/app_text_field/app_password_text_field.dart';
import 'package:dc_flutter_cli/components/app_text_field/app_phone_field.dart';
import 'package:dc_flutter_cli/router/app_router.dart';
import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:dc_flutter_cli/pages/login/login_controller.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode passwordFocusNode = useFocusNode();
    final ValueNotifier<bool> canSubmit = useState(false);
    return GetBuilder<LoginController>(
      builder: (_) {
        return GestureDetector(
          onTap: FocusManager.instance.primaryFocus?.unfocus,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              actions: [
                TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.register),
                    child: Text(AppLocaleKey.register.name.tr))
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20),
                    Text(
                      AppLocaleKey.loginTip.name.tr,
                      style: Get.theme.textTheme.bodyMedium,
                    ),
                    Gap(24),
                    Text(
                      AppLocaleKey.phoneNumber.name.tr,
                      style: Get.theme.textTheme.bodySmall,
                    ),
                    AppPhoneTextField(
                      onChanged: _.setPhoneNumber,
                      onFieldSubmitted: (String s) {
                        passwordFocusNode.requestFocus();
                      },
                    ),
                    Gap(18),
                    Text(
                      AppLocaleKey.password.name.tr,
                      style: Get.theme.textTheme.bodySmall,
                    ),
                    AppPasswordTextField(
                      onChanged: _.setPassword,
                      focusNode: passwordFocusNode,
                      onFieldSubmitted: (String s) {
                        _.login();
                      },
                    )
                  ],
                )),
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Container(
                padding: EdgeInsets.only(
                  left: 18,
                  right: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.forgetPasswrd),
                      child: Text(
                        AppLocaleKey.forgetPassword.name.tr,
                        style: Get.textTheme.labelLarge?.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Gap(12),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                        onPressed: canSubmit.value ? _.login : null,
                        child: Text(
                          AppLocaleKey.signIn.name.tr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
