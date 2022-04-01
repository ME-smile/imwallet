import 'package:flutter/material.dart';

class SettingTileModel {
  String? icon;
  String? title;
  String? value;
  Widget? trailing;
  Function()? onTap;

  SettingTileModel(
      {this.icon, this.title, Widget? trailing, this.value, this.onTap}) {
    this.trailing = value != null
        ? null
        : trailing ?? Image.asset('assets/images/arrow_right.png');
  }
}
