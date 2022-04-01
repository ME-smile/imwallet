class ContactLeverModel {
  int? maxBuy;
  int? maxSell;
  String? longLever;
  String? shortLever;
  String? maxLever;
  double? margin;
  int? sz;
  int? modifyStatus;
  String? side;
  ContactLeverModel.fromJson(Map json) {
    maxBuy = json['maxBuy'];
    maxSell = json['maxSell'];
    longLever = json['longLever'];
    shortLever = json['shortLever'];
    maxLever = json['maxLever'];
    margin = json['margin'];
    sz = json['sz'];
    modifyStatus = json['modifyStatus'];
    side = json['side'];
  }
}
