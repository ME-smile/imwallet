/*
 * @Description: 鉴权中间件
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:17:29
 * @LastEditTime: 2021-09-18 15:17:30
 */
import 'package:dc_flutter_cli/storage/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_router.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 9;

  @override
  RouteSettings? redirect(String? route) {
    return SpUtil.getString(SpKey.token)?.isNotEmpty ?? false
        ? null
        : RouteSettings(name: AppRoutes.login);
  }
}
