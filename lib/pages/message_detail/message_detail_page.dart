import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/model/response/notification_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MessageDetailPage extends HookWidget {
  final NotificatioMesssageModel message;
  const MessageDetailPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      UserAPI.updateUnReadStatus(noticeUserId: '${message.noticeId}');
      return null;
    });
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.secondary,
      appBar: AppBar(
        title: Text('消息详情'),
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${message.title}',
                style: Get.textTheme.bodyLarge,
              ),
              Gap(18),
              Text(
                '${message.createTime}',
                style: Get.textTheme.labelMedium,
              ),
              Gap(20),
              Text(
                '${message.content}',
                style: Get.textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
