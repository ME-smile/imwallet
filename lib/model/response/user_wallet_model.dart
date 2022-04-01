class UserWalletModel {
  double? balance;
  double? usdtbalance;

  UserWalletModel.fromJson(Map json) {
    balance = double.tryParse(json['balance']);
    usdtbalance = double.tryParse(json['usdtbalance']);
  }
}
