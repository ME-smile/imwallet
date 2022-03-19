/*
 * @Description: 图标
 * @Author: iamsmiling
 * @Date: 2021-09-18 16:01:04
 * @LastEditTime: 2021-09-18 16:01:04
 */
part of r;

class _RIcon {
  static _RIcon _singleton = _RIcon._();
  // ignore: unused_element
  _RIcon._();
  factory _RIcon() => _singleton;
  final String eyeClose = 'assets/images/eye_close.png';
  final String eyeOpen = 'assets/images/eye_open.png';
  final String checkBox = 'assets/images/check.png';

  final String home = 'assets/images/home.png';
  final String homeSelected = 'assets/images/home_selected.png';

  final String quantification = 'assets/images/quantification.png';
  final String quantificationSelected =
      'assets/images/quantification_selected.png';

  final String follow = 'assets/images/follow.png';
  final String followSelected = 'assets/images/follow_selected.png';

  final String strategy = 'assets/images/strategy.png';
  final String strategySelected = 'assets/images/quantification_selected.png';

  final String profit = 'assets/images/profit.png';
  final String profitSelected = 'assets/images/profit_selected.png';
}
