import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/pages/index/index_controller.dart';
import 'package:dc_flutter_cli/res/R.dart';
import 'package:dc_flutter_cli/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class MessageBadge extends HookWidget {
  const MessageBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> count = useState(0);
    Future fetch() {
      return UserAPI.getUnReadMessageCount().then((value) {
        count.value = value;
      });
    }

    useEffect(() {
      fetch();
      Get.find<IndexController>().registerRefreshCallback(fetch);
      return null;
    }, []);
    return IconButton(
      onPressed: () {
        Get.toNamed(AppRoutes.messageList)?.then<void>((value) {
          fetch();
        });
      },
      icon: Stack(
        children: [
          Image.asset(R.icon.message),
          Positioned(
            right: 0,
            top: 0,
            child: Visibility(
              visible: count.value > 0,
              child: Container(
                transform: Matrix4.translationValues(5, -5, 0),
                constraints: BoxConstraints(
                  minHeight: 16,
                  minWidth: 16,
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${count.value}',
                  style: Get.textTheme.labelMedium,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
