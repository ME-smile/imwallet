/*
 * @Description: app主题
 * @Author: iamsmiling
 * @Date: 2021-09-18 16:02:00
 * @LastEditTime: 2022-01-28 12:58:15
 */

import 'package:flutter/material.dart';
import 'package:dc_flutter_cli/res/R.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(
      color: R.color.iconColor,
    ),
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: R.color.cursorColor),
    // colorScheme: ColorScheme(brightness: Brightness.light, primary: R.color.scaffoldBackgroundColor, onPrimary: onPrimary, secondary: Color(0xFFC78904), onSecondary: Colors.white, error: Colors.red, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
    scaffoldBackgroundColor: R.color.scaffoldBackgroundColor,
    primaryColor: R.color.primary,
    accentColor: R.color.accentColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: R.color.appBarBackgroundColor,
      elevation: .5,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: R.color.appBarTitleColor,
      ),
    ),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: R.color.primary),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: R.color.primaryTextColor),
      displayMedium: TextStyle(color: R.color.primaryTextColor),
      displaySmall: TextStyle(color: R.color.primaryTextColor),
      headlineLarge: TextStyle(color: R.color.primaryTextColor),
      headlineMedium: TextStyle(color: R.color.primaryTextColor),
      headlineSmall: TextStyle(color: R.color.primaryTextColor),
      titleLarge: TextStyle(color: R.color.primaryTextColor),
      titleMedium: TextStyle(color: R.color.primaryTextColor),
      titleSmall: TextStyle(color: R.color.primaryTextColor),
      bodyLarge: TextStyle(
        color: R.color.bodyLargeColor,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: R.color.bodyLargeColor,
        fontSize: 15,
      ),
      bodySmall: TextStyle(
        color: R.color.bodyLargeColor,
        fontSize: 13,
      ),
      labelLarge: TextStyle(color: R.color.primaryTextColor),
      labelMedium: TextStyle(color: R.color.primaryTextColor),
      labelSmall: TextStyle(
        color: R.color.labelSmallColor,
        fontSize: 10,
      ),
      // headline1: TextStyle(color: R.color.primaryTextColor),
      // headline2: TextStyle(color: R.color.primaryTextColor),
      // headline3: TextStyle(color: R.color.primaryTextColor),
      // headline4: TextStyle(color: R.color.primaryTextColor),
      // headline5: TextStyle(color: R.color.primaryTextColor),
      // headline6: TextStyle(color: R.color.primaryTextColor),

      // subtitle1: TextStyle(color: R.color.primaryTextColor),
      // subtitle2: TextStyle(color: R.color.primaryTextColor),
      // bodyText1: TextStyle(color: R.color.bodyText1Color, fontSize: 15),
      // bodyText2: TextStyle(color: R.color.bodyText2Color, fontSize: 13),
      // button: TextStyle(color: R.color.primaryTextColor),
      // caption: TextStyle(color: R.color.primaryTextColor),
      // overline: TextStyle(color: R.color.primaryTextColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: R.color.inputHintColor,
          fontSize: 10,
        ),
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        focusedBorder: InputBorder.none
        // enabledBorder: UnderlineInputBorder(
        //     borderSide:
        //         BorderSide(color: R.color.textFieldBorder, width: .5)),
        // focusedBorder: UnderlineInputBorder(
        //     borderSide:
        //         BorderSide(color: R.color.textFieldBorder, width: .5)),
        // border: UnderlineInputBorder(
        //     borderSide:
        //         BorderSide(color: R.color.textFieldBorder, width: .5))
        ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      splashFactory: NoSplash.splashFactory,
      foregroundColor: MaterialStateProperty.all(R.color.textButton),
      textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5)),
          foregroundColor:
              MaterialStateProperty.all(R.color.elevatedButtonTextColor),
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: R.color.diabledEvatedButtonTextColor);
            }
            return TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return R.color.disabledElevatedButtonColor;
            }
            return R.color.elevatedButtonColor;
          }),
          minimumSize: MaterialStateProperty.all(Size.fromHeight(36))),
    ),
    disabledColor: R.color.diabledEvatedButtonTextColor,
  );

  static ThemeData dartTheme = lightTheme;
}
