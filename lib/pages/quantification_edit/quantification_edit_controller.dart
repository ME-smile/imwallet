import 'package:dc_flutter_cli/api/quantification_api.dart';
import 'package:dc_flutter_cli/model/response/contact_constraint_model.dart';
import 'package:dc_flutter_cli/model/response/contract_quantificaion_plan_model.dart';
import 'package:dc_flutter_cli/model/response/expected_plan_model.dart';
import 'package:dc_flutter_cli/utils/toast_util.dart';
import 'package:get/get.dart';

import '../../model/response/api_account_model.dart';

enum TransactionActionType { buyingLong, shortSelling, bilateral }

extension $TransactionActionType on TransactionActionType {
  String get zhLabel =>
      {
        TransactionActionType.buyingLong: '买多',
      }[this] ??
      '';
}

enum QuantificationType { system, custom }
enum LoopMode { auto, single }

class QuantificaionEditController extends GetxController {
  AccountVOSModel? currentVOS = null;
  ContactLeverModel? contractLever;
  ExpectedPlanModel? expectedPlan;
  String? currency;
  TransactionActionType actionType = TransactionActionType.buyingLong;
  LoopMode? loopMode;
  final ContractQuantificationPlanModel? plan = Get.arguments;
  bool get isNew => Get.arguments == null;

  void setCurrentVOS(String accountId) {
    ToastUtil.loading();
    QuantificaionAPI.getAccountVOSById(accountId: accountId).then((value) {
      currentVOS = value;
      if (currentVOS?.isTreaty == true) {
        QuantificaionAPI.getContractLeverAvailSize().then((value) {
          contractLever = value;
        });
      }
      return value;
    }).then((value) {
      QuantificaionAPI.getExpectUsed(
              contract: value.contract, currency: value.currency)
          .then((value) {
        expectedPlan = value;
      });
    }).whenComplete(() {
      update();
      ToastUtil.dismiss();
    });
  }

  void setCurrency(String currency) {
    this.currency = currency;
    update();
  }

  void setActionType(TransactionActionType action) {
    actionType = action;
    update();
  }
}
