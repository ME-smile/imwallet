import 'package:dc_flutter_cli/http/http.dart';
import 'package:dc_flutter_cli/model/response/carousel_image_model.dart';
import 'package:dc_flutter_cli/model/response/home_data_model.dart';
import 'package:dc_flutter_cli/model/response/profit_brief_model.dart';
import 'package:dc_flutter_cli/model/response/transaction_record_model.dart';

abstract class HomeAPI {
  static Future<HomeDataModel> getHomeData({
    required String userId,
  }) {
    return _getStatistics(userId).then((value) {
      return HomeDataModel(profitBrief: value);
    }).then((value) {
      return _getProjectImages().then((v) {
        return value.copyWith(carousels: v);
      });
    }).then((value) {
      print(value);
      return getTransactionRecords().then((v) {
        return value.copyWith(transactionRecords: v);
      });
    });
  }

  static Future<ProfitBriefModel> _getStatistics(String userId) {
    return Http.instance
        .get(ApiRequest('/maxmoneycloud-funds/userStatistics/getStatistics',
            query: <String, dynamic>{'userId': userId}))
        .then((value) => ProfitBriefModel.fromJson(value.data));
  }

  static Future<List<CarouselImageModel>> _getProjectImages() {
    return Http.instance
        .get(ApiRequest('/maxmoneycloud-users/projectImages/getProjectImges'))
        .then((value) {
      if (value.data is List) {
        return value.data
            .map((e) => CarouselImageModel.fromJson(e))
            .toList()
            .cast<CarouselImageModel>();
      }
      return [].cast<CarouselImageModel>();
    });
  }

  static Future<List<TransactionRecordModel>> getTransactionRecords({
    int pageSize = 10,
    int page = 1,
    int sortField = 1,
  }) {
    return Http.instance
        .post(ApiRequest(
            '/maxmoneycloud-funds/userStatistics/getStatisticsList',
            formData: <String, dynamic>{
          'size': pageSize,
          'current': page,
          'sortField': sortField,
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
