import 'package:dc_flutter_cli/pages/quantification_edit/quantification_edit_controller.dart';
import 'package:dc_flutter_cli/pages/quantification_edit/sheets/switch_account_sheet.dart';
import 'package:dc_flutter_cli/pages/quantification_edit/sheets/switch_currency_sheet.dart';
import 'package:get/get.dart';

class QuantificaionEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuantificaionEditController());
    Get.put(SwitchAccountController(), permanent: true);
    Get.put(SwitchCurrencyController());
  }
}
