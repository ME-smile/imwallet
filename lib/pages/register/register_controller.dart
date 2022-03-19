import 'package:dc_flutter_cli/model/request/register_arg_model.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterArgModel _arg = RegisterArgModel(
    password: '',
    phoneNumber: '',
    invitationCode: '',
    smsCode: '',
    confirmPassword: '',
  );

  void setPhoneNumber(String phoneNumber) {
    _arg.phoneNumber = phoneNumber;
  }

  void setPassword(String password) {
    _arg.password = password;
  }

  void setConfirmPassword(String password) {
    _arg.confirmPassword = password;
  }

  void setInvitationCode(String password) {
    _arg.invitationCode = password;
  }

  void setSmsCode(String code) {
    _arg.smsCode = code;
  }
}
