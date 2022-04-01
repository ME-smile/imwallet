import 'package:flutter/material.dart';

abstract class MaxMoneyColor {
  static Color primary = Color(0xFF8CBD4D);
  static Color secondary = const Color(0xFF394545);
  static Color tertiary = Color(0xFF243133);

  static Color onSurface = Color(0xFF243133).withOpacity(.5);
  static Color onSecondary = Colors.white;

  static Color secondaryContainer = const Color(0xFF395747).withOpacity(.3);
  static Color tertiaryContainer = const Color(0xFF374142).withOpacity(.2);
  static Color onTertiaryContainer = const Color(0xFFF8F0F0);

  static Color backgroundColor = const Color(0xFF243233);
  static Color onBackgroundColor = Colors.white;
  // static Color tertiary = Color(0xFF5C6566);

  static Color scaffoldBackgroundColor = Color(0xFF1E1F24);
  static Color appBarBackgroundColor = Color(0xFF1E1F24);
  static Color bottomNavigationBarColor = Color(0xFF1E1F24);
  static Color popupModalBackgroundColor = Color(0xFF545454);

  static Color chipBackgroundColor = const Color(0xFF495153);
  static Color cardColor = const Color(0xFF5C6566);

  static Color primaryTextColor = Colors.white;
  static Color labelColor = const Color(0xFFB7B7B7);
  static Color unselectedLabelColor = Color(0xFFB7B7B7);
  static Color primaryIconColor = Colors.white;
  static Color dialogBackgroundColor = Color(0xFF545454);
  static Color dividerColor = Color(0xFFB7B7B7);
  static Color inputDecorationBackgroundColor =
      Color.fromRGBO(120, 120, 120, 1);
  static Color elevatedButtonForegroundColor = Colors.white;
  static Color elevatedButtonBackgroundColor = Color(0xFF8CBD4D);

  static Color buttonSecondary = Color(0xFF787878);
  static Color buttonOnSecondary = Color(0xFFB7B7B7);
}
