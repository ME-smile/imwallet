import 'package:dc_flutter_cli/pages/quantification/queatification_controller.dart';
import 'package:get/instance_manager.dart';

class QuantificaionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuantificationController());
  }
}
