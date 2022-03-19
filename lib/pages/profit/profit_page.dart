import 'package:dc_flutter_cli/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfitPage extends StatelessWidget {
  const ProfitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('收益')),
      body: TextButton(
        child: Text("退出"),
        onPressed: () {
          Get.toNamed(AppRoutes.login);
        },
      ),
    );
  }
}
