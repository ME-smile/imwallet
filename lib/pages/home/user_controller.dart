import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/model/response/user_profile_model.dart';
import 'package:dc_flutter_cli/storage/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends BaseFutureLoadStateController<UserProfileModel> {
  UserProfileModel? user;
  @override
  Future<UserProfileModel> loadData({Map? params}) {
    return UserAPI.getProfile().then((value) {
      user = value;
      SpUtil.setJson(SpKey.user, value.toJson());
      return value;
    });
  }

  late ValueNotifier<bool> isDarkTheme;
  void setDartTheme(bool isDark) {
    isDarkTheme.value = isDark;
    Get.changeTheme(ThemeData());
    // Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    // update();
  }

  void _changeThemeListener() {
    Get.changeTheme(isDarkTheme.value ? ThemeData.light() : ThemeData.dark());
  }

  @override
  void onInit() {
    super.onInit();
    isDarkTheme = ValueNotifier(false)..addListener(_changeThemeListener);
  }

  @override
  void onClose() {
    super.onClose();
    isDarkTheme.removeListener(_changeThemeListener);
    isDarkTheme.dispose();
  }
}
