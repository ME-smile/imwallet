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

  final Color scaffoldBackgroundColor = const Color(0xFF1E1F24);

  final Color appBarBackgroundColor = const Color(0xFF1E1F24);

  final Color appBarTitleColor = const Color(0xFFFDFDFD);

  final Color primary = const Color(0xFF8FC54B);

  final Color textButton = Colors.white;

  final Color secondary = Colors.white;

  final Color primaryTextColor = const Color(0xFF8FC54B);

  final Color textFieldBorder = const Color(0xFF222222);

  final Color disabledElevatedButtonColor = const Color(0xFF826F47);
  final Color elevatedButtonColor = const Color(0xFFC78904);
  final Color elevatedButtonTextColor = Colors.white;
  final Color diabledEvatedButtonTextColor = const Color(0xFFB7B7B7);
  final Color labelMediumColor = const Color(0xFFB7B7B7);

  final Color bodyText1Color = Colors.white;

  final Color bodyText2Color = Colors.white;

  final Color bodyLargeColor = Colors.white;

  final Color bodySmallColor = Color(0xFFB7B7B7);
  final Color labelSmallColor = Color(0xFFB7B7B7);

  final Color enabledInputDecorationBorder = Color(0xFFB7B7B7);

  final Color focusdInputDecorationBorder = Color(0xFFECECEC);

  final Color cursorColor = const Color(0xFF201812);

  final Color inputHintColor = const Color(0xFF999999);

  final Color iconColor = Colors.white;

  final Color accentColor = const Color(0xFFC78904);

  final Color hoverColor = Colors.white.withOpacity(.1);
  final Color hintColor = const Color(0xFF1B2628).withOpacity(.8);
  final Color cardColor = Colors.white;
  final Color selectedRowColor = const Color(0xFFA3A8A8).withOpacity(.5);
  final Color unselectedWidgetColor = const Color(0xFFA3A8A8).withOpacity(.7);
  final Color unselectedLabelColor = const Color(0xFFB7B7B7);
  final Color tabLabelColor = Colors.white;
  final Color colorScheme = Colors.white;
  final Color chipColor = const Color(0xFF495153).withOpacity(.3);

  final Color bottomNavigationBarBackgroundColor = const Color(0xFF1E1F24);
}
