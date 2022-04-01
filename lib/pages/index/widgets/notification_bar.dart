import 'dart:async';

import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/model/response/notification_message_model.dart';
import 'package:dc_flutter_cli/pages/home/home_controller.dart';
import 'package:dc_flutter_cli/pages/index/index_controller.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NotificationBar extends HookWidget {
  const NotificationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = usePageController();

    final ValueNotifier<List<NotificatioMesssageModel>> notifications =
        useState([]);
    Future fetch() {
      return UserAPI.getMessages().then((value) {
        notifications.value = value;
      });
    }

    useEffect(() {
      fetch();
      Get.find<IndexController>().registerRefreshCallback(fetch);
      return null;
    }, []);

    int currentPage = 0;
    useMemoized(
      () => Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) {
          currentPage++;
          if (currentPage >= notifications.value.length) {
            currentPage = 0;
            pageController.jumpToPage(currentPage);
          } else {
            pageController.animateToPage(
              currentPage,
              duration: Duration(seconds: 1),
              curve: Curves.easeOutCubic,
            );
          }
        },
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      height: 36,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(R.icon.notification),
          Gap(12),
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: notifications.value.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int i) {
                final NotificatioMesssageModel item = notifications.value[i];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.messageDetail,
                        arguments: item, preventDuplicates: false);
                  },
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('${item.title}')),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
