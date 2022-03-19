import 'package:dc_flutter_cli/controllers/user_controller.dart';
import 'package:dc_flutter_cli/pages/index/index_controller.dart';
import 'package:get/get.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IndexController());
    Get.lazyPut(() => UserController());
  }
}
