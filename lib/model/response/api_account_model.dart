class ApiAccountModel {
  String? apiKey;
  String? secretKey;
  String? uid;
  String? photo;
  String? nickname;
  String? houseCn;
  String? house;
  List<AccountTypeVOSModel>? accountTypeVOSList;
  ApiAccountModel.fromJson(Map json) {
    apiKey = json['apiKey'];
    secretKey = json['secretKey'];
    uid = json['uid'];
    photo = json['photo'];
    house = json['house'];
    houseCn = json['houseCn'];
    nickname = json['nickname'];
    if (json['accountTypeVOS'] is List) {
      List list = json['accountTypeVOS'] as List;
      accountTypeVOSList =
          list.map((e) => AccountTypeVOSModel.fromJson(e)).toList();
    }
  }
}

class AccountTypeVOSModel {
  String? id;
  String? userApiId;
  String? userId;
  int? contractType;
  String? contractName;
  String? logo;
  int? checked;
  List<AccountVOSModel>? accountVOSList;

  AccountTypeVOSModel.fromJson(Map json) {
    id = json['id'];
    userApiId = json['userApiId'];
    userId = json['userId'];
    contractType = json['contractType'];
    contractName = json['contractName'];
    logo = json['logo'];
    checked = json['checked'];
    if (json['accountVOS'] is List) {
      List list = json['accountVOS'] as List;
      accountVOSList = list.map((e) => AccountVOSModel.fromJson(e)).toList();
    }
  }
}

class AccountVOSModel {
  String? name;
  String? id;
  int? accountType;
  int? contractType;
  String? accountTypeId;
  String? currency;
  String? contractName;
  String? contract;
  String? contractCn;
  String? logo;
  String? accountRights;

  AccountVOSModel.fromJson(Map json) {
    name = json['name'];
    id = json['id'];
    contract = json['contract'];
    accountType = json['accountType'];
    contractType = json['contractType'];
    contractName = json['contractStr'];
    accountTypeId = json['accountTypeId'];
    currency = json['currency'];
    logo = json['logo'];
    accountRights = json['accountRights'];
    contractCn = json['contractCn'];
  }

  ///是否为合约
  bool get isTreaty => contract == 'SWAP';
}
