/*
 * @Description: 登录逻辑
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:23:38
 * @LastEditTime: 2021-09-18 15:44:17
 */
import 'package:dc_flutter_cli/controllers/user_controller.dart';
import 'package:dc_flutter_cli/model/request/login_arg_model.dart';
import 'package:dc_flutter_cli/router/app_router.dart';
import 'package:dc_flutter_cli/storage/sp_util.dart';
import 'package:get/get.dart';
import 'package:dc_flutter_cli/api/login_api.dart';

class LoginController extends GetxController {
  final LoginArgModel _arg = LoginArgModel(
    password: '',
    phoneNumber: '',
  );

  Future login() {
    if (!_validateArg()) return Future.error(ArgumentError.value(_arg));
    return LoginAPI.loginByPassword(arg: _arg).then((value) {
      return SpUtil.setJson(SpKey.token, value.toJson());
    }).then((value) {
      Get.find<UserController>().fetchData();
    }).then((value) {
      Get.toNamed(AppRoutes.home);
    });
  }

  void setPhoneNumber(String phoneNumber) {
    _arg.phoneNumber = phoneNumber;
  }

  void setPassword(String password) {
    _arg.password = password;
  }

  bool _validateArg() {
    if (!_arg.vaidatePhoneNumber()) {
      Get.snackbar('', '请输入正确的手机号', duration: Duration(milliseconds: 1500));
      return false;
    }
    if (!_arg.vaidatePassword()) {
      Get.snackbar('', '密码不能为空哦');
      return false;
    }
    return true;
  }
}
