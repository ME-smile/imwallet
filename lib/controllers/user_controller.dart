import 'package:dc_flutter_cli/model/response/user_profile_model.dart';
import 'package:dc_flutter_cli/api/user_api.dart';
import 'package:dc_flutter_cli/storage/sp_util.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserController extends GetxController {
  UserProfileModel? user;

  Future fetchData() {
    return UserAPI.getProfile().then((value) {
      user = value;
      return value;
    });
  }

  @override
  void onInit() {
    super.onInit();
    if (SpUtil.getJson(SpKey.token) == null) return;
    fetchData();
  }
}
