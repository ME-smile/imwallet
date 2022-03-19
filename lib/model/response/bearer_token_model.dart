class BearerTokenModel {
  String token = '';
  int expiresIn = 0;
  BearerTokenModel.fromJson(Map json) {
    token = json['token'];
    expiresIn = json['expiresIn'];
  }

  Map toJson() => {
        'token': token,
        'expiresIn': expiresIn,
      };
}
