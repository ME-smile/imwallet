/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:18:19
 * @LastEditTime: 2021-09-18 15:19:55
 */

import 'package:dc_flutter_cli/pages/accounts/accounts_controller.dart';
import 'package:dc_flutter_cli/pages/home/app_controller.dart';
import 'package:dc_flutter_cli/pages/home/user_controller.dart';
import 'package:dc_flutter_cli/pages/index/index_controller.dart';
import 'package:dc_flutter_cli/pages/quantification/queatification_controller.dart';
import 'package:get/get.dart';
import 'package:dc_flutter_cli/pages/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(UserController());
    Get.put(HomeController());
    Get.lazyPut(() => IndexController());
    Get.lazyPut(() => QuantificationController());
    Get.lazyPut(() => AccountsController());
  }
}
