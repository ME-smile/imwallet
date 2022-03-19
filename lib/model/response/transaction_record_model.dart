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
  }
}
