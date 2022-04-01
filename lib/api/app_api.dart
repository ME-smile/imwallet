/*
 * @Description: 登录相关
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:39:50
 * @LastEditTime: 2021-09-18 15:43:35
 */
import 'package:dc_flutter_cli/config/app_config.dart';
import 'package:dc_flutter_cli/http/http.dart';

abstract class AppAPI {
  /// 密码登录(包含手机或邮箱,name传手机或邮箱)
  static Future<String> getApkUrl() {
    return Http.instance
        .get(ApiRequest('/maxmoneycloud-admin/project/inviteRegistAndDownLoad'))
        .then((value) {
      return value.data;
    });
  }

  static Future checkAppVersion() {
    return Http.instance.get(
      ApiRequest(
        '/maxmoneycloud-admin/version/getNewVersion',
        query: <String, dynamic>{'version': '0.001'},
      ),
    );
  }
}
