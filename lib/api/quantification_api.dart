import 'package:dc_flutter_cli/http/http.dart';
import 'package:dc_flutter_cli/model/response/api_account_model.dart';
import 'package:dc_flutter_cli/model/response/contact_constraint_model.dart';
import 'package:dc_flutter_cli/model/response/contract_model.dart';
import 'package:dc_flutter_cli/model/response/contract_quantificaion_plan_model.dart';
import 'package:dc_flutter_cli/model/ui/quantification_model.dart';

enum QuantificaionType {
  sellerApi,
  buyerApi,
}

extension $QuantificaionType on QuantificaionType {
  int get type =>
      {
        QuantificaionType.sellerApi: 1,
        QuantificaionType.buyerApi: 2,
      }[this] ??
      1;
}

abstract class QuantificaionAPI {
  /// 密码登录(包含手机或邮箱,name传手机或邮箱)
  static Future<List<QuantificationModel>> getQuantifications(
      {required QuantificaionType quantType}) {
    return Http.instance
        .get(ApiRequest('/maxmoneycloud-quantstrategy/userStrategy/selApiAll',
            query: {
              'quantType': quantType.type,
              'statusType': 1,
            },
            loading: true))
        .then((value) {
      if (value.data is List) {
        return value.data
            .map((e) => QuantificationModel.fromJson(e))
            .toList()
            .cast<QuantificationModel>();
      }
      return [].cast<QuantificationModel>();
    });
  }

  static Future<List<SellerAccountModel>> getSellerAccounts({
    required QuantificaionType quantType,
    required String userAPiId,
  }) {
    return Http.instance
        .get(ApiRequest(
            '/maxmoneycloud-quantstrategy/userStrategy/selAccountAll',
            query: {
              'quantType': quantType.type,
              'userAPiId': userAPiId,
              'statusType': 1,
            },
            loading: true))
        .then((value) {
      if (value.data is List) {
        return value.data
            .map((e) => SellerAccountModel.fromJson(e))
            .toList()
            .cast<SellerAccountModel>();
      }
      return [].cast<SellerAccountModel>();
    });
  }

  static Future<List<ContractQuantificationPlanModel>>
      getContractQuantificationPlans({
    required String currency,
    required String userAPiId,
  }) {
    return Http.instance
        .post(ApiRequest('/maxmoneycloud-quantstrategy/userStrategy/newDetail',
            formData: {
              'userAPiId': userAPiId,
              'currency': currency,
              'status': 20,
              'quantType': 1,
            },
            loading: true))
        .then((value) {
      if (value.data is List) {
        return value.data
            .map((e) => ContractQuantificationPlanModel.fromJson(e))
            .toList()
            .cast<ContractQuantificationPlanModel>();
      }
      return [].cast<ContractQuantificationPlanModel>();
    });
  }

  static Future<AccountVOSModel> getAccountVOSById({
    required String accountId,
  }) {
    return Http.instance
        .get(ApiRequest(
            '/maxmoneycloud-users/account/getUserAccountAndHouseApiByAccountId',
            query: {
              'accountId': accountId,
            },
            loading: true))
        .then((value) => AccountVOSModel.fromJson(value.data));
  }

  static Future<List> getCurrencyList(
      {required String? contract, required String? currency}) {
    return Http.instance
        .get(ApiRequest('/maxmoneycloud-users/okexApi/getOkexCurrencyList',
            query: <String, String?>{
              'instType': contract,
              'currency': currency
            }))
        .then((value) => value.data);
  }

  static Future getExpectUsed(
      {required String? contract, required String? currency}) {
    return Http.instance
        .post(ApiRequest('/maxmoneycloud-quantstrategy/userStrategy/expectUsed',
            query: <String, String?>{
          'instType': contract,
          'currency': currency
        }))
        .then((value) {
      // if (value.data is List) {
      //   return value.data
      //       .map((e) => ApiAccountModel.fromJson(e))
      //       .toList()
      //       .cast<ApiAccountModel>();
      // }
      // return [].cast<ApiAccountModel>();
    });
  }

  static Future<ContactLeverModel> getContractLeverAvailSize() {
    return Http.instance
        .post(ApiRequest(
            '/maxmoneycloud-okex-processor/userStrategy/getContractLeverAvailSize'))
        .then((value) => ContactLeverModel.fromJson(value.data));
  }
}
