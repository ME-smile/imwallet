library app_router;

import 'package:dc_flutter_cli/pages/accounts/accounts_page.dart';
import 'package:dc_flutter_cli/pages/forget_password/forget_password_binding.dart';
import 'package:dc_flutter_cli/pages/forget_password/forget_password_page.dart';
import 'package:dc_flutter_cli/pages/help/help_page.dart';
import 'package:dc_flutter_cli/pages/invite_friend/invite_friend_page.dart';
import 'package:dc_flutter_cli/pages/message_detail/message_detail_page.dart';
import 'package:dc_flutter_cli/pages/message_list/message_list_binding.dart';
import 'package:dc_flutter_cli/pages/message_list/message_list_page.dart';
import 'package:dc_flutter_cli/pages/open_account/open_account_page.dart';
import 'package:dc_flutter_cli/pages/profile/profile_page.dart';
import 'package:dc_flutter_cli/pages/quantification/quantificaion_binding.dart';
import 'package:dc_flutter_cli/pages/quantification/quantification_page.dart';
import 'package:dc_flutter_cli/pages/quantification_edit/quantificaion_edit_binding.dart';
import 'package:dc_flutter_cli/pages/quantification_edit/quantification_edit_page.dart';
import 'package:dc_flutter_cli/pages/register/register_page.dart';
import 'package:dc_flutter_cli/pages/register/register_binding.dart';
import 'package:dc_flutter_cli/pages/team/team_page.dart';
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
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: AppRoutes.messageList,
        page: () => MessageListPage(),
        binding: MessageListBinding()),
    GetPage(
      name: AppRoutes.messageDetail,
      page: () => MessageDetailPage(
        message: Get.arguments,
      ),
    ),
    GetPage(
        name: AppRoutes.quantificaionList,
        page: () => QuantificationPage(),
        binding: QuantificaionBinding()),
    GetPage(
        name: AppRoutes.quantificaionEdit,
        page: () => QuantificationEditPage(),
        binding: QuantificaionEditBinding()),
    GetPage(
      name: AppRoutes.openAccount,
      page: () => OpenAccountPage(),
    ),
    GetPage(
      name: AppRoutes.inviteFriend,
      page: () => InviteFriendPage(),
    ),
    GetPage(
      name: AppRoutes.accounts,
      page: () => AccountsPage(),
    ),
    GetPage(
      name: AppRoutes.help,
      page: () => HelpPage(),
    ),
    GetPage(
      name: AppRoutes.team,
      page: () => TeamPage(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePgae(),
    ),
  ];
}
