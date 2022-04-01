import 'package:dc_flutter_cli/app_language.dart';
import 'package:dc_flutter_cli/components/app_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLanguageSheet extends StatelessWidget {
  const AppLanguageSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Text(
            '选择语言',
            style: TextStyle(fontSize: 15),
          ),
        ),
        Container(
          width: double.infinity,
          height: 2,
          color: Colors.black,
        ),
        GestureDetector(
          onTap: () {
            Get.back(result: AppLanguage.zh);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              '${AppLanguage.zh.label}',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
        Divider(
          height: 0,
          thickness: 0,
          indent: 12,
          endIndent: 12,
        ),
        GestureDetector(
          onTap: () {
            Get.back(result: AppLanguage.en);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              '${AppLanguage.en.label}',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}

Future<AppLanguage?> showSelectAppLanguageSheet(BuildContext context) {
  return showAppModalPopup<AppLanguage>(
    context: context,
    barrierDismissible: true,
    maxHeight: MediaQuery.of(context).size.height * .227,
    builder: (BuildContext context) {
      return AppLanguageSheet();
    },
  );
}
