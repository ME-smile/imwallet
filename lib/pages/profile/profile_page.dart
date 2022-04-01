import 'package:dc_flutter_cli/components/app_user_avatar.dart';
import 'package:dc_flutter_cli/pages/home/user_controller.dart';
import 'package:dc_flutter_cli/pages/profile/sheets/change_user_avatar_sheet.dart';
import 'package:dc_flutter_cli/pages/profile/sheets/change_user_gender_sheet.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePgae extends GetView<UserController> {
  const ProfilePgae({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
      ),
      body: GetBuilder<UserController>(builder: (_) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 18),
          children: [
            GestureDetector(
              onTap: () {
                showChangeUserAvatarSheet(context);
              },
              child: Row(
                children: [
                  AppUserAvatar(
                    url: 'url',
                    width: 36,
                    height: 36,
                    radius: 18,
                  ),
                  Spacer(),
                  Text(
                    '更换',
                    style: Get.textTheme.labelLarge,
                  ),
                  Image.asset(R.icon.arrowRight)
                ],
              ),
            ),
            Row(
              children: [
                Text('昵称'),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                showChangeUserGenderSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('性别'),
                  Text('男'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('手机'),
                Text('184****9098'),
              ],
            ),
          ]
              .map((e) => Container(
                  height: 60,
                  margin: EdgeInsets.only(bottom: 6),
                  padding: EdgeInsets.only(left: 8, right: 12),
                  decoration: BoxDecoration(
                      color: Get.theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(5)),
                  child: e))
              .toList(),
        );
      }),
    );
  }
}
