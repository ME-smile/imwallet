import 'package:flutter/material.dart';

class ProfileTileModel {
  Widget? leading;
  Widget? trailing;
  String? label;
  String? value;
  bool? readOnly;
  Function()? onTap;
  ProfileTileModel({
    this.label,
    this.value,
    this.leading,
    this.trailing,
    this.readOnly = true,
    this.onTap,
  });
}
