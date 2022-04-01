class UserTeamModel {
  String? id;
  String? userId;
  String? nickname;
  String? userLevel;
  String? avatar;
  String? registerDate;
  String? incomeToday;
  String? incomeAll;
  String? incomeYestoday;
  int? subordinateToday;
  int? subordinateAll;
  int? subordinateYestoday;
  int? childCount;

  UserTeamModel.fromJson(Map json) {
    id = json['id'];
    userId = json['userId'];
    nickname = json['nickname'];
    userLevel = json['userLevel'];
    avatar = json['avatar'];
    registerDate = json['registerDate'];
    incomeToday = json['incomeToday'];
    incomeAll = json['incomeAll'];
    incomeYestoday = json['incomeYestoday'];
    subordinateToday = json['subordinateToday'];
    subordinateAll = json['subordinateAll'];
    subordinateYestoday = json['subordinateYestoday'];
    childCount = json['childCount'];
  }
}
