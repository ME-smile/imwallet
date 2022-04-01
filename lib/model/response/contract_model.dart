class SellerAccountModel {
  String? currency;
  String? contractName;
  String? userApiId;

  SellerAccountModel.fromJson(Map json) {
    currency = json['currency'];
    contractName = json['contractName'];
    userApiId = json['userApiId'];
  }
}
