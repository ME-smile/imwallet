import 'package:dc_flutter_cli/http/http.dart';
import 'package:dc_flutter_cli/model/response/user_profile_model.dart';

abstract class UserAPI {
  static Future<UserProfileModel> getProfile() {
    return Http.instance
        .post(ApiRequest('/maxmoneycloud-users/user/me'))
        .then((value) => UserProfileModel.fromJson(value.data));
  }

  static Future getUnReadMessageCount() {
    return Http.instance
        .get(ApiRequest('/maxmoneycloud-users/notice/unReadCount'));
  }
}
