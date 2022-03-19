/*
 * @Description: 登录
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:24:36
 * @LastEditTime: 2021-09-18 15:29:35
 */
import 'package:dc_flutter_cli/pages/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
