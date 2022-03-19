enum AppFlavor {
  Waves,
  MaxMoney,
  HuiYinBao,
  YuanyunQuantification,
  ContractCaptain,
  QuantificationMaster,
  QunlinQuantification,
  SmartFox,
  QuantificationTalent,
  TransactionManager,
}

extension AppFlavorKit on AppFlavor {
  String get id =>
      {
        AppFlavor.TransactionManager: 'ID_20201212_00000000000000000001',
        AppFlavor.QuantificationTalent: 'ID_20201212_00000000000000000002',
        AppFlavor.SmartFox: 'ID_20201212_00000000000000000003',
        AppFlavor.QunlinQuantification: 'ID_20201212_00000000000000000004',
        AppFlavor.QuantificationMaster: 'ID_20201212_00000000000000000005',
        AppFlavor.ContractCaptain: 'ID_20201212_00000000000000000006',
        AppFlavor.YuanyunQuantification: 'ID_20201212_00000000000000000007',
        AppFlavor.HuiYinBao: 'ID_20201212_00000000000000000008',
        AppFlavor.MaxMoney: 'ID_20201212_88888888888888888888',
        AppFlavor.Waves: 'ID_20201212_11111111111111111111'
      }[this] ??
      '';
  String get label =>
      {
        AppFlavor.TransactionManager: '交易管家',
        AppFlavor.QuantificationTalent: '量化达人',
        AppFlavor.SmartFox: '智狐',
        AppFlavor.QunlinQuantification: '群林量化',
        AppFlavor.QuantificationMaster: '量化大师',
        AppFlavor.ContractCaptain: '合约队长',
        AppFlavor.YuanyunQuantification: '远云量化',
        AppFlavor.HuiYinBao: '慧赢宝',
        AppFlavor.MaxMoney: 'MaxMoney',
        AppFlavor.Waves: 'Waves'
      }[this] ??
      '';
  String get launchImage =>
      {
        AppFlavor.TransactionManager: '交易管家',
        AppFlavor.QuantificationTalent: '量化达人',
        AppFlavor.SmartFox: '智狐',
        AppFlavor.QunlinQuantification: '群林量化',
        AppFlavor.QuantificationMaster: '量化大师',
        AppFlavor.ContractCaptain: '合约队长',
        AppFlavor.YuanyunQuantification: '远云量化',
        AppFlavor.HuiYinBao: '慧赢宝',
        AppFlavor.MaxMoney: 'MaxMoney',
        AppFlavor.Waves: 'Waves'
      }[this] ??
      '';
  String get logo =>
      {
        AppFlavor.TransactionManager: '交易管家',
        AppFlavor.QuantificationTalent: '量化达人',
        AppFlavor.SmartFox: '智狐',
        AppFlavor.QunlinQuantification: '群林量化',
        AppFlavor.QuantificationMaster: '量化大师',
        AppFlavor.ContractCaptain: '合约队长',
        AppFlavor.YuanyunQuantification: '远云量化',
        AppFlavor.HuiYinBao: '慧赢宝',
        AppFlavor.MaxMoney: 'MaxMoney',
        AppFlavor.Waves: 'Waves'
      }[this] ??
      '';
}

AppFlavor getAppFlavor(String flavor) {
  for (AppFlavor appFlavor in AppFlavor.values) {
    if (appFlavor.name == flavor) return appFlavor;
  }
  return AppFlavor.MaxMoney;
}
