import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantificationPage extends StatelessWidget {
  const QuantificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocaleKey.myQuantification.name.tr)),
    );
  }
}
