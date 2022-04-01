import 'package:dc_flutter_cli/res/R.dart';
import 'package:flutter/material.dart';

class AppEmptyPlaceHolder extends StatelessWidget {
  final String desc;
  const AppEmptyPlaceHolder({Key? key, this.desc = '暂无数据'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [Image.asset(R.icon.empty), Text('$desc')],
      ),
    );
  }
}
