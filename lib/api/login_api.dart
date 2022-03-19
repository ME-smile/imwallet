/*
 * @Description: 登录相关
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:39:50
 * @LastEditTime: 2021-09-18 15:43:35
 */
import 'package:dc_flutter_cli/http/http.dart';
import 'package:dc_flutter_cli/model/request/login_arg_model.dart';
import 'package:dc_flutter_cli/model/response/bearer_token_model.dart';

abstract class LoginAPI {
  /// 密码登录(包含手机或邮箱,name传手机或邮箱)
  static Future<BearerTokenModel> loginByPassword(
      {required LoginArgModel arg}) {
    return Http.instance
        .post(ApiRequest('/maxmoneycloud-auth/oauth/token',
            withToken: false, query: arg.params, loading: true))
        .then((value) => BearerTokenModel.fromJson(value.data));
  }
}
