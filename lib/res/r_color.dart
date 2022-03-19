/*
 * @Description: 颜色相关
 * @Author: iamsmiling
 * @Date: 2021-09-18 16:00:13
 * @LastEditTime: 2021-09-18 16:04:50
 */
part of r;

class _RColor {
  static _RColor _singleton = _RColor._();
  // ignore: unused_element
  _RColor._();
  factory _RColor() => _singleton;

  final Color scaffoldBackgroundColor = const Color(0xFF3D3733);

  final Color appBarBackgroundColor = Colors.black;

  final Color appBarTitleColor = const Color(0xFFFDFDFD);

  final Color primary = const Color(0xFF201812);

  final Color textButton = Colors.white;

  final Color primaryTextColor = Colors.white;

  final Color textFieldBorder = const Color(0xFF222222);

  final Color disabledElevatedButtonColor = const Color(0xFF826F47);
  final Color elevatedButtonColor = const Color(0xFFC78904);
  final Color elevatedButtonTextColor = Colors.white;
  final Color diabledEvatedButtonTextColor = const Color(0xFFB7B7B7);

  final Color bodyText1Color = Colors.white;

  final Color bodyText2Color = Colors.white;

  final Color bodyLargeColor = Colors.white;

  final Color labelSmallColor = Color(0xFFB7B7B7);

  final Color enabledInputDecorationBorder = Color(0xFFB7B7B7);

  final Color focusdInputDecorationBorder = Color(0xFFECECEC);

  final Color cursorColor = const Color(0xFF201812);

  final Color inputHintColor = const Color(0xFF999999);

  final Color iconColor = Colors.white;

  final Color accentColor = const Color(0xFFC78904);
}
