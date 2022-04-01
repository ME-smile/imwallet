class QuantificationModel {
  String? avatar;
  String? house;
  String? nickname;
  String? userApiId;

  QuantificationModel.fromJson(Map json) {
    avatar = json['avatar'];
    house = json['house'];
    nickname = json['nickname'];
    userApiId = json['userApiId'];
  }
}
