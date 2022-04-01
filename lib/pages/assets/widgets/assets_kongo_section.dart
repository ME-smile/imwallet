import 'package:dc_flutter_cli/model/ui/assets_kongo_model.dart';
import 'package:dc_flutter_cli/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AssetsKongoSection extends HookWidget {
  const AssetsKongoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double itemWidth = (Get.width - 12 * 2 - 18 * 2 - 15) / 2;
    final List<AssetsKongoModel> kongos = useMemoized(
        () => [
              AssetsKongoModel(title: '我的团队', desc: '傻瓜式轻松躺赚'),
              AssetsKongoModel(title: '邀请好友', desc: '高收益共同分钱'),
              AssetsKongoModel(title: '分享海报', desc: '好项目一起赚钱'),
              AssetsKongoModel(
                  title: '最新消息',
                  desc: '行业动态一点通',
                  onTap: () {
                    Get.toNamed(AppRoutes.messageList);
                  }),
            ],
        []);
    return DefaultTextStyle(
      style: TextStyle(
        color: Get.theme.colorScheme.onTertiaryContainer,
      ),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Wrap(
          runSpacing: 15,
          spacing: 15,
          children: [
            for (AssetsKongoModel item in kongos)
              GestureDetector(
                onTap: item.onTap,
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 8),
                  decoration: BoxDecoration(
                      color: Get.theme.primaryColor.withOpacity(.35),
                      borderRadius: BorderRadius.circular(5)),
                  width: itemWidth,
                  child: Column(
                    children: [
                      Text(
                        '${item.title}',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Gap(6),
                      Text(
                        '${item.desc}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
