import 'package:dc_flutter_cli/translations/app_translations.dart';
import 'package:get/get.dart';

class ProfitBriefModel {
  String? todayProfit;
  String? totalProfits;
  String? yestodayProfits;
  int? tradeTimes;
  String? retracementRate;
  int? tradeStatus;
  String? walletBalance;
  String? winRate;
  String? yieldRate;
  int? profitsSwapSort;
  String? profitsMarket;
  int? profitsMarketSort;
  String? profitsSpot;
  int? profitsSpotSort;
  ProfitBriefModel.fromJson(Map json) {
    todayProfit = json['todayProfits'];
    totalProfits = json['totalProfits'];
    yestodayProfits = json['yestodayProfits'];
    tradeTimes = json['tradeTimes'];
    retracementRate = json['retracementRate'];
    tradeStatus = json['tradeStatus'];
    yieldRate = json['yieldRate'];
    walletBalance = json['walletBalance'];
    winRate = json['winRate'];
    profitsSwapSort = json['profitsSwapSort'];
    profitsMarket = json['profitsMarket'];
    profitsMarketSort = json['profitsMarketSort'];
    profitsSpot = json['profitsSpot'];
    profitsSpotSort = json['profitsSpotSort'];
  }

  String get status =>
      <int?, String>{
        0: AppLocaleKey.notTrade.name.tr,
        1: AppLocaleKey.trading.name.tr,
      }[tradeStatus] ??
      '';
}
