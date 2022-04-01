import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:get/get.dart';

class TransactionRecordModel {
  String? userId;
  String? nickname;
  String? avatar;
  int? settingDay;
  int? tradeTimes;
  String? retracementRate;
  int? tradeStatus;
  String? yieldRate;
  String? walletBalance;
  String? winRate;
  int? sorted;
  String? todayProfits;
  String? totalProfits;
  String? yestodayProfits;
  String? profitsMarketMonth;
  int? profitsMarketMonthSort;
  int? profitsSwapSort;
  String? profitsMarket;
  int? profitsMarketSort;
  String? profitsSpot;
  int? profitsSpotSort;
  String? sex;
  String? profitsSwapMonth;
  int? profitsSwapMonthSort;
  TransactionRecordModel.fromJson(Map json) {
    userId = json['userId'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    settingDay = json['settingDay'];
    tradeTimes = json['tradeTimes'];
    retracementRate = json['retracementRate'];
    tradeStatus = json['tradeStatus'];
    yieldRate = json['yieldRate'];
    walletBalance = json['walletBalance'];
    winRate = json['winRate'];
    sorted = json['sorted'];
    todayProfits = json['todayProfits'];
    totalProfits = json['totalProfits'];
    yestodayProfits = json['yestodayProfits'];
    profitsSwapSort = json['profitsSwapSort'];
    profitsMarket = json['profitsMarket'];
    profitsMarketSort = json['profitsMarketSort'];
    profitsSpot = json['profitsSpot'];
    profitsSpotSort = json['profitsSpotSort'];
    profitsMarketMonth = json['profitsMarketMonth'];
    profitsMarketMonthSort = json['profitsMarketMonthSort'];
    sex = json['sex'];
    profitsSwapMonth = json['profitsSwapMonth'];
    profitsSwapMonthSort = json['profitsSwapMonthSort'];
  }

  String get status =>
      <int?, String>{
        0: AppLocaleKey.notTrade.name.tr,
        1: AppLocaleKey.trading.name.tr,
      }[tradeStatus] ??
      '';
  String get gender => <String?, String>{'0': '男', '1': '女'}[sex] ?? '男';
}
