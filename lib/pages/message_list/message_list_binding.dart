import 'package:dc_flutter_cli/pages/message_list/message_list_controller.dart';
import 'package:get/get.dart';

class MessageListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageListController());
  }
}
