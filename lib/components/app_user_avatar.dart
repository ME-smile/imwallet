import 'package:date_format/date_format.dart';
import 'package:dc_flutter_cli/app_flavor.dart';
import 'package:dc_flutter_cli/components/app_image.dart';
import 'package:flutter/material.dart';

class AppUserAvatar extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit? boxFit;
  const AppUserAvatar(
      {Key? key,
      required this.url,
      this.height,
      this.radius = 0.0,
      this.width,
      this.boxFit})
      : super(key: key);
  String get defaultAvatar =>
      {
        AppFlavor.TransactionManager:
            'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male.png',
        AppFlavor.QuantificationTalent:
            'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male.png',
        AppFlavor.SmartFox:
            'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male.png',
        AppFlavor.QunlinQuantification:
            'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male.png',
        AppFlavor.QuantificationMaster:
            'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male.png',
        AppFlavor.ContractCaptain:
            'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male_hydz.png',
        AppFlavor.YuanyunQuantification:
            'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male.png',
        AppFlavor.HuiYinBao:
            'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male.png',
        AppFlavor.MaxMoney:
            'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male.png',
        AppFlavor.Waves:
            'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male.png'
      }[this] ??
      '';
  String get avatar {
    if (url.isEmpty) return defaultAvatar;
    return [
      'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male.png',
      'http://img-strategymall.qqtowns.com/strategy-mall-file/strategy-project/project/male_hydz.png'
    ].contains(url)
        ? defaultAvatar
        : url;
  }

  @override
  Widget build(BuildContext context) {
    return AppNetWorkImage(
      'https://img1.baidu.com/it/u=4215217856,3618581392&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
      width: width,
      height: height,
      radius: radius,
      fit: boxFit,
    );
  }
}
