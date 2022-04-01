import 'package:dc_flutter_cli/pages/home/home_controller.dart';
import 'package:dc_flutter_cli/typedefs/future_callback.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class IndexController extends GetxController {
  List<FutureCallback> _refreshCallbacks = <FutureCallback>[];
  Future refreshData() {
    return Future.wait(_refreshCallbacks.map((e) => Function.apply(e, null)));
  }

  void registerRefreshCallback(FutureCallback callback) {
    _refreshCallbacks.add(callback);
  }

  void openDrawer() {
    Function.apply(Get.find<HomeController>().openDrawer ?? () {}, []);
  }
}
