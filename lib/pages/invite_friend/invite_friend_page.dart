import 'package:date_format/date_format.dart';
import 'package:dc_flutter_cli/api/app_api.dart';
import 'package:dc_flutter_cli/components/app_image.dart';
import 'package:dc_flutter_cli/pages/home/user_controller.dart';
import 'package:dc_flutter_cli/storage/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InviteFriendPage extends StatelessWidget {
  const InviteFriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.tertiary,
      appBar: AppBar(
        title: Text('我的邀请码'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '邀请好友加入平台吧！',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Gap(12),
              Text(
                '一起轻松赚钱！仅开放少量名额哦！',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Gap(18),
              Text(
                '仅限2000名好友体验！名额有限，好机会要尽快分享哦！',
                style: TextStyle(
                    fontSize: 13, color: Get.textTheme.labelSmall?.color),
              ),
              Gap(64),
              HookBuilder(builder: (BuildContext context) {
                final ValueNotifier<String> url = useState('');
                useEffect(() {
                  AppAPI.getApkUrl().then((value) {
                    url.value = value;
                  });
                  return null;
                }, []);
                return Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        color: Colors.white,
                        width: 240,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: QrImage(
                          data: url.value,
                          size: 200,
                        ),
                      ),
                      Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(5),
                          child: AppNetWorkImage(
                            '${SpUtil.getString(SpKey.projectLogo)}',
                            width: 24,
                          )),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: Get.mediaQuery.padding.bottom + 32,
          left: 12,
          right: 12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Text(
                  '${Get.find<UserController>().user?.inviteCode ?? 'ABCDEF'}',
                  style: TextStyle(fontSize: 13, color: Color(0xFF333333)),
                ),
              ),
            ),
            Container(
              color: Get.theme.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Text(
                '复制邀请码',
                style: TextStyle(fontSize: 13, height: 1.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
