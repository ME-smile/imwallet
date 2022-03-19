import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingDrawer extends StatelessWidget {
  const SettingDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(right: 84, top: 56),
      child: Column(
        children: [
          ListTile(
            title: Text('语言'),
            onTap: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Text('选择语言');
                  });
              // showBottomSheet(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return Text('选择语言');
              //     });
            },
          )
        ],
      ),
    );
  }
}
