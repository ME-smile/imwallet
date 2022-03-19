import 'package:dc_flutter_cli/config/app_config.dart';
import 'package:dc_flutter_cli/model/base/base_arg_model.dart';

class LoginArgModel implements BaseArgModel {
  String? phoneNumber;
  String? password;
  String? zoneCode;
  LoginArgModel(
      {required this.password,
      required this.phoneNumber,
      this.zoneCode = '86'});

  @override
  Map<String, dynamic> get params => {
        "grant_type": "password",
        "client_id": "maxmoneycloud-mobile",
        "client_secret": "123456",
        "username": phoneNumber,
        "password": password,
        "zoneCode": zoneCode,
        "projectId": AppConfig.projectId,
      };

  bool vaidatePhoneNumber() {
    RegExp reg = new RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    return reg.hasMatch(phoneNumber ?? '');
  }

  bool vaidatePassword() {
    return password?.isNotEmpty == true;
  }
}
