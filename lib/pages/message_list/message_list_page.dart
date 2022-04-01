import 'package:dc_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:dc_flutter_cli/model/response/notification_message_model.dart';
import 'package:dc_flutter_cli/pages/message_list/message_list_controller.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MessageListPage extends HookWidget {
  const MessageListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureLoadStateBuilder<MessageListController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('最新消息'),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '全部已读',
                    style: Get.textTheme.bodySmall,
                  ),
                  Gap(6),
                  Image.asset(R.icon.markAsRead),
                ],
              ),
            )
          ],
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12),
          itemBuilder: (BuildContext context, int i) {
            final NotificatioMesssageModel item = _.notifications[i];
            return HookBuilder(builder: (context) {
              final ValueNotifier<bool> hasRead = useState(item.hasRead);
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.messageDetail,
                          arguments: item, preventDuplicates: false)
                      ?.then((value) {
                    hasRead.value = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Get.theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.createTime}',
                            style: Get.textTheme.labelMedium,
                          ),
                          Gap(12),
                          Text(
                            '${item.title}',
                            style: Get.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Spacer(),
                      Visibility(
                        visible: !hasRead.value,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Get.theme.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
          },
          itemCount: _.notifications.length,
        ),
      );
    });
  }
}
