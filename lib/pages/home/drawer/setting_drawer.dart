import 'package:dc_flutter_cli/components/app_button.dart';
import 'package:dc_flutter_cli/components/app_image.dart';
import 'package:dc_flutter_cli/config/app_config.dart';
import 'package:dc_flutter_cli/model/ui/setting_tile_model.dart';
import 'package:dc_flutter_cli/pages/home/user_controller.dart';
import 'package:dc_flutter_cli/pages/home/user_sheet/app_language_sheet.dart';
import 'package:dc_flutter_cli/pages/home/user_sheet/app_password_sheet.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/router/app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class SettingDrawer extends GetView<UserController> {
  const SettingDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (BuildContext context) {
      final List<SettingTileModel> tiles = useMemoized(
          () => [
                SettingTileModel(
                    icon: R.icon.secure,
                    title: '安全中心',
                    onTap: () {
                      showChangeAppPasswordSheet(context);
                    }),
                SettingTileModel(
                  icon: R.icon.language,
                  title: '选择语言',
                  onTap: () {
                    showSelectAppLanguageSheet(context);
                  },
                ),
                SettingTileModel(
                  icon: R.icon.theme,
                  title: '偏好设置',
                  trailing: AdvancedSwitch(
                    controller: controller.isDarkTheme,
                    key: ValueKey(controller.isDarkTheme.value),
                    width: 48.0,
                    height: 24.0,
                    activeColor: Get.theme.primaryColor,
                    inactiveColor: Colors.grey,
                    activeChild: Image.asset(R.icon.day),
                    inactiveChild: Image.asset(R.icon.night),
                  ),
                ),
                SettingTileModel(
                  icon: R.icon.appPolicy,
                  title: '服务协议',
                ),
                SettingTileModel(
                  icon: R.icon.appPravicy,
                  title: '隐私政策',
                ),
                SettingTileModel(
                  icon: R.icon.help,
                  title: '用户帮助',
                ),
                SettingTileModel(
                  icon: R.icon.appUpgrade,
                  title: '版本更新',
                  value: AppConfig.appVersion,
                ),
              ],
          []);
      return GetBuilder<UserController>(builder: (_) {
        return Container(
          height: Get.height,
          color: Get.theme.colorScheme.tertiary,
          margin: EdgeInsets.only(right: 84),
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.profile)?.then((value) {});
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: AppNetWorkImage(
                              '${_.user?.avatar}',
                              width: 48,
                              height: 48,
                            ),
                          ),
                          Gap(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${_.user?.nickname}'),
                              Text('${_.user?.mobile}')
                            ],
                          ),
                          Spacer(),
                          Image.asset(R.icon.arrowRight),
                          Gap(12),
                        ],
                      ),
                    ),
                    for (SettingTileModel item in tiles)
                      GestureDetector(
                        onTap: item.onTap,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 12),
                              child: Row(
                                children: [
                                  Image.asset('${item.icon}'),
                                  Gap(12),
                                  Text('${item.title}'),
                                  Spacer(),
                                  if (item.value == null)
                                    item.trailing ?? SizedBox.shrink()
                                  else
                                    Text('${item.value}')
                                ],
                              ),
                            ),
                            if (item != tiles.last)
                              Divider(
                                indent: 12,
                                endIndent: 12,
                                thickness: 0,
                                height: 0,
                                color: Get.theme.dividerColor,
                              ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
              bottomNavigationBar: AppButton(
                text: '退出登录',
                onTap: () {},
                padding: EdgeInsets.symmetric(horizontal: 18),
                margin: EdgeInsets.only(
                  bottom: Get.mediaQuery.padding.bottom + 28,
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}
