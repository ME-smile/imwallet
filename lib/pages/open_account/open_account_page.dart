import 'package:dc_flutter_cli/res/R.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OpenAccountPage extends StatelessWidget {
  const OpenAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('合作平台')),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: Get.theme.colorScheme.tertiary),
              child: DefaultTextStyle(
                style: TextStyle(fontSize: 13),
                child: Column(
                  children: [
                    Gap(18),
                    Text(
                      '重要提示',
                      style: TextStyle(fontSize: 15),
                    ),
                    Gap(18),
                    Text('1. 以下为本平台支持的第三方交易所官方注册地址，请扫描您偏好的交易所二维码，先注册，再下载并登录;'),
                    Gap(5),
                    Text(
                        '2. 本平台通过API与交易所建立联接!您须登录交易所软件、开通 交易权限后，再获取您的API (详见帮助) ;'),
                    Gap(5),
                    Text(
                        '3. 各交易所默认的API有效期，最长仅90天!本平台持续、高频执行交易，如API过期，有可能产生交易风险;'),
                    Gap(5),
                    Text(
                        '4. 强烈建议您在获取API时，将以下IP地址复制到交易所指定位置，从而获取永久生效的API、以确保交易安全;'),
                    Gap(18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '150.109.71.101,119.28.32.95,101.33.117.107',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          '复制',
                          style: TextStyle(
                              fontSize: 10, color: Get.theme.primaryColor),
                        ),
                      ],
                    ),
                    Gap(18),
                  ],
                ),
              ),
            ),
            Gap(38),
            Image.asset(
              R.icon.downloadQrCode,
              height: 200,
              width: 200,
            ),
            Gap(18),
            Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' 欧易交易所官方注册地址',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    '复制',
                    style:
                        TextStyle(fontSize: 13, color: Get.theme.primaryColor),
                  ),
                ],
              ),
            ),
            Gap(24),
            Text(
              '*请复制链接后，使用谷歌浏览器打开*',
              style: TextStyle(
                  fontSize: 10, color: Get.textTheme.labelSmall?.color),
            )
          ],
        )),
      ),
    );
  }
}
