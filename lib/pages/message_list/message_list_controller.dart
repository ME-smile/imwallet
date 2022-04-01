import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/model/response/notification_message_model.dart';
import 'package:get/get.dart';

class MessageListController
    extends BaseFutureLoadStateController<List<NotificatioMesssageModel>> {
  List<NotificatioMesssageModel> notifications = [];
  @override
  Future<List<NotificatioMesssageModel>> loadData({Map? params}) {
    return UserAPI.getMessages().then((value) {
      notifications = value;
      return value;
    });
  }
}
