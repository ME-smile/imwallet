import 'package:dc_flutter_cli/http/http.dart';
import 'package:dc_flutter_cli/model/response/api_account_model.dart';
import 'package:dc_flutter_cli/model/response/notification_message_model.dart';
import 'package:dc_flutter_cli/model/response/profit_brief_model.dart';
import 'package:dc_flutter_cli/model/response/transaction_record_model.dart';
import 'package:dc_flutter_cli/model/response/user_profile_model.dart';
import 'package:dc_flutter_cli/model/response/user_wallet_model.dart';

abstract class UserAPI {
  static Future<UserProfileModel> getProfile() {
    return Http.instance
        .post(ApiRequest('/maxmoneycloud-users/user/me'))
        .then((value) => UserProfileModel.fromJson(value.data));
  }

  static Future<int> getUnReadMessageCount() {
    return Http.instance
        .get(ApiRequest('/maxmoneycloud-users/notice/unReadCount'))
        .then((value) {
      return value.data;
    });
  }

  static Future<List<NotificatioMesssageModel>> getMessages({
    int page = 1,
    int pageSize = 5,
  }) {
    return Http.instance
        .post(ApiRequest('/maxmoneycloud-users/notice/user',
            formData: <String, dynamic>{
          "current": page,
          "size": pageSize,
        }))
        .then((value) {
      if (value.data is List) {
        return value.data
            .map((e) => NotificatioMesssageModel.fromJson(e))
            .toList()
            .cast<NotificatioMesssageModel>();
      }
      return [].cast<NotificatioMesssageModel>();
    });
  }

  static Future<List<ApiAccountModel>> getApiAccounts() {
    return Http.instance
        .get(ApiRequest('/maxmoneycloud-users/account/getMyAllApiAccount'))
        .then((value) {
      if (value.data is List) {
        return value.data
            .map((e) => ApiAccountModel.fromJson(e))
            .toList()
            .cast<ApiAccountModel>();
      }
      return [].cast<ApiAccountModel>();
    });
  }

  static Future updateUnReadStatus({required String noticeUserId}) {
    return Http.instance.get(ApiRequest(
        '/maxmoneycloud-users/notice/updateUnReadStatus',
        query: {'noticeUserId': noticeUserId}));
  }

  static Future markAllMessageAsRead() {
    return Http.instance.post(
        ApiRequest('/maxmoneycloud-users/notice/batchUpdateAllUnReadStatus'));
  }

  static Future<ProfitBriefModel> getStatistics() {
    return Http.instance
        .get(ApiRequest(
          '/maxmoneycloud-funds/userProfits/getUserProfits',
        ))
        .then((value) => ProfitBriefModel.fromJson(value.data));
  }

  static Future<ProfitBriefModel> getUserProfits() {
    return Http.instance
        .get(ApiRequest(
          '/maxmoneycloud-funds/userProfits/getUserProfits',
        ))
        .then((value) => ProfitBriefModel.fromJson(value.data));
  }

  static Future<UserWalletModel> getWalletData() {
    return Http.instance
        .get(ApiRequest(
          ' /maxmoneycloud-funds/api/wallet/userWallet',
        ))
        .then((value) => UserWalletModel.fromJson(value.data));
  }

  static Future<List<TransactionRecordModel>> getRankData({
    int pageSize = 10,
    int page = 1,
    required String type,
  }) {
    return Http.instance
        .post(ApiRequest('/maxmoneycloud-funds/userProfits/getUserProfitsList',
            formData: <String, dynamic>{
          'size': pageSize,
          'current': page,
          'filterType': type,
        }))
        .then((value) {
      if (value.data is List) {
        return value.data
            .map((e) => TransactionRecordModel.fromJson(e))
            .toList()
            .cast<TransactionRecordModel>();
      }
      return [].cast<TransactionRecordModel>();
    });
  }
}
