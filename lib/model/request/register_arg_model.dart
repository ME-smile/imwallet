import 'package:dc_flutter_cli/model/base/base_arg_model.dart';

class RegisterArgModel implements BaseArgModel {
  String phoneNumber;
  String password;
  String confirmPassword;
  String zoneCode;
  String invitationCode;
  String smsCode;

  RegisterArgModel({
    required this.password,
    required this.phoneNumber,
    required this.invitationCode,
    required this.smsCode,
    required this.confirmPassword,
    this.zoneCode = '86',
  });

  @override
  Map<String, dynamic> get params => {
        "inviteCode": invitationCode,
        "loginPassword": password,
        "phoneNumber": phoneNumber,
        "verificationCode": smsCode,
        "zoneCode": zoneCode,
      };

  bool vaidatePhoneNumber() {
    RegExp reg = new RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    return reg.hasMatch(phoneNumber);
  }

  bool vaidatePassword() {
    if (password.isEmpty || confirmPassword.isEmpty) return false;
    RegExp reg = new RegExp(r'^[0-9a-zA-Z!$ #%]{8,20}$');
    if (!reg.hasMatch(password) || !reg.hasMatch(confirmPassword)) return false;
    return password == confirmPassword;
  }
}
