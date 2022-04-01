class ExpectedPlanModel {
  String? expectSz;
  String? expectPx;
  String? expectRate;
  String? expectMargin;
  String? expectFee;
  String? leverage;
  String? errorMsg;
  ExpectedPlanModel.fromJson(Map json) {
    expectSz = json['expectSz'];
    expectPx = json['expectPx'];
    expectRate = json['expectRate'];
    expectMargin = json['expectMargin'];
    expectFee = json['expectFee'];
    leverage = json['leverage'];
    errorMsg = json['errorMsg'];
  }
}
