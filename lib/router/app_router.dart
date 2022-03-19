/*
 * @Description: app路由与页面关联
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:01:42
 * @LastEditTime: 2022-02-07 15:31:20
 */
library app_router;

import 'package:dc_flutter_cli/pages/forget_password/forget_password_binding.dart';
import 'package:dc_flutter_cli/pages/forget_password/forget_password_page.dart';
import 'package:dc_flutter_cli/pages/index/index_binding.dart';
import 'package:dc_flutter_cli/pages/index/index_page.dart';
import 'package:dc_flutter_cli/pages/register/register_page.dart';
import 'package:dc_flutter_cli/pages/register/register_binding.dart';
import 'package:dc_flutter_cli/router/middleware/auth_middleware.dart';
import 'package:get/route_manager.dart';
import 'package:dc_flutter_cli/pages/404/unknown_page.dart';
import 'package:dc_flutter_cli/pages/home/home_binding.dart';
import 'package:dc_flutter_cli/pages/home/home_page.dart';
import 'package:dc_flutter_cli/pages/login/login_binding.dart';
import 'package:dc_flutter_cli/pages/login/login_page.dart';
import 'package:dc_flutter_cli/storage/sp_util.dart';
part 'app_routes.dart';

abstract class AppRouter {
  static bool get hasLogin =>
      SpUtil.getString(SpKey.token)?.isNotEmpty ?? false;
  static String get initial => hasLogin ? AppRoutes.home : AppRoutes.login;

  static final pages = [
    GetPage(name: AppRoutes.unknown, page: () => UnknownPage()),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: AppRoutes.register,
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: AppRoutes.forgetPasswrd,
        page: () => ForgetPasswordPage(),
        binding: ForgetPasswordBinding()),
    GetPage(
        name: AppRoutes.home,
        page: () => HomePage(),
        binding: HomeBinding(),
        bindings: [
          IndexBinding(),
        ],
        middlewares: [
          AuthMiddleware()
        ]),
  ];
}
