enum AppLanguage {
  zh,
  en,
}

extension $AppLanguage on AppLanguage {
  String get label =>
      {
        AppLanguage.en: '英文',
        AppLanguage.zh: '中文',
      }[this] ??
      '';
}

enum AppPasswordType {
  asset,
  account,
}

extension $AppPasswordType on AppPasswordType {
  String get label =>
      {
        AppPasswordType.asset: '资产密码重置',
        AppPasswordType.account: '登录密码重置',
      }[this] ??
      '';
}
