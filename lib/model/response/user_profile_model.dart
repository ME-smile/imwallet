class UserProfileModel {
  String? id;
  String? username;
  String? nickname;
  int? userLevel;
  String? inviteCode;
  String? avatar;
  String? mobile;
  int? active;
  int? gender;

  UserProfileModel.fromJson(Map json) {
    id = json['id'];
    username = json['username'];
    nickname = json['nickname'];
    userLevel = json['userLevel'];
    inviteCode = json['inviteCode'];
    avatar = json['avatar'];
    mobile = json['mobile'];
    gender = json['sex'];
    active = json['active'];
  }
}
