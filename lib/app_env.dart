enum AppEnvironment {
  ///线上环境
  prod,

  ///测试环境
  test,

  ///开发环境
  debug
}

extension AppEnvironmentHost on AppEnvironment {
  String get APIHOST =>
      {
        AppEnvironment.debug: "http://8.210.237.119:9003",
        AppEnvironment.prod: "http://47.242.46.103:9003",
        AppEnvironment.test: "http://47.242.201.140:9003"
      }[this] ??
      "";

  String get imageHost => 'https://imag.kqwad.com/';

  String get backupImageHost => 'https://www.kqwad.com/pointsmall/';
}

AppEnvironment getAppEnv(String env) {
  for (AppEnvironment appEnv in AppEnvironment.values) {
    if (appEnv.name == env) return appEnv;
  }
  return AppEnvironment.debug;
}
