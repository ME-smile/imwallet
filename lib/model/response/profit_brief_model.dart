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
  }
}
