/*
 * @Description: app主题
 * @Author: iamsmiling
 * @Date: 2021-09-18 16:02:00
 * @LastEditTime: 2022-01-28 12:58:15
 */

import 'package:dc_flutter_cli/res/max_money_color.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData maxMoneyTheme = ThemeData(
    useMaterial3: true,
    cardColor: MaxMoneyColor.cardColor,
    colorScheme: ColorScheme(
      background: MaxMoneyColor.backgroundColor,
      onBackground: MaxMoneyColor.onBackgroundColor,
      brightness: Brightness.dark,
      error: Colors.red,
      onError: Colors.red,
      onSurface: Colors.transparent,
      primary: MaxMoneyColor.primary,
      onPrimary: MaxMoneyColor.primary,
      secondary: MaxMoneyColor.secondary,
      onSecondary: MaxMoneyColor.onSecondary,
      tertiary: MaxMoneyColor.tertiary,
      onTertiary: MaxMoneyColor.onSecondary,
      surface: MaxMoneyColor.backgroundColor,
      tertiaryContainer: MaxMoneyColor.tertiaryContainer,
      onTertiaryContainer: MaxMoneyColor.onTertiaryContainer,
      secondaryContainer: MaxMoneyColor.secondaryContainer,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: MaxMoneyColor.primaryTextColor),
      displayMedium: TextStyle(color: MaxMoneyColor.primaryTextColor),
      displaySmall: TextStyle(color: MaxMoneyColor.primaryTextColor),
      headlineLarge: TextStyle(color: MaxMoneyColor.primaryTextColor),
      headlineMedium: TextStyle(color: MaxMoneyColor.primaryTextColor),
      headlineSmall: TextStyle(color: MaxMoneyColor.primaryTextColor),
      titleLarge: TextStyle(color: MaxMoneyColor.primaryTextColor),
      titleMedium: TextStyle(color: MaxMoneyColor.primaryTextColor),
      titleSmall: TextStyle(color: MaxMoneyColor.primaryTextColor),
      bodyLarge: TextStyle(
        color: MaxMoneyColor.primaryTextColor,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: MaxMoneyColor.primaryTextColor,
        fontSize: 15,
      ),
      bodySmall: TextStyle(
        color: MaxMoneyColor.primaryTextColor,
        fontSize: 13,
      ),
      labelLarge: TextStyle(color: MaxMoneyColor.labelColor),
      labelMedium: TextStyle(color: MaxMoneyColor.labelColor, fontSize: 12),
      labelSmall: TextStyle(
        color: MaxMoneyColor.labelColor,
        fontSize: 10,
      ),
    ),
    primaryColor: MaxMoneyColor.primary,
    scaffoldBackgroundColor: MaxMoneyColor.scaffoldBackgroundColor,
    iconTheme: IconThemeData(color: MaxMoneyColor.primaryIconColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: MaxMoneyColor.inputDecorationBackgroundColor,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      border: InputBorder.none,
    ),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: MaxMoneyColor.appBarBackgroundColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: MaxMoneyColor.primaryTextColor,
        ),
        iconTheme: IconThemeData(color: MaxMoneyColor.primaryIconColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MaxMoneyColor.bottomNavigationBarColor,
      selectedItemColor: MaxMoneyColor.primary,
      selectedIconTheme: IconThemeData(color: MaxMoneyColor.primary),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: MaxMoneyColor.primaryTextColor,
      unselectedLabelColor: MaxMoneyColor.unselectedLabelColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: MaxMoneyColor.primary,
          width: 4,
        ),
      ),
    ),
    chipTheme: ChipThemeData(
        backgroundColor: MaxMoneyColor.chipBackgroundColor,
        labelStyle: TextStyle(
          color: MaxMoneyColor.primaryTextColor,
          fontSize: 10,
        )),
    dialogBackgroundColor: MaxMoneyColor.dialogBackgroundColor,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    dividerColor: MaxMoneyColor.dividerColor,
    dividerTheme: DividerThemeData(
      color: MaxMoneyColor.dividerColor,
      thickness: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return MaxMoneyColor.elevatedButtonBackgroundColor.withOpacity(.5);
          }
          return MaxMoneyColor.elevatedButtonBackgroundColor;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return MaxMoneyColor.elevatedButtonForegroundColor.withOpacity(.5);
          }
          return MaxMoneyColor.elevatedButtonForegroundColor;
        }),
      ),
    ),
    buttonTheme: ButtonThemeData(
        height: 36,
        minWidth: double.maxFinite,
        colorScheme: ColorScheme(
          background: Colors.transparent,
          onBackground: Colors.transparent,
          brightness: Brightness.dark,
          error: Colors.transparent,
          onError: Colors.transparent,
          onSurface: Colors.transparent,
          primary: Colors.transparent,
          onPrimary: Colors.transparent,
          secondary: MaxMoneyColor.buttonSecondary,
          onSecondary: MaxMoneyColor.buttonOnSecondary,
          tertiary: Colors.transparent,
          onTertiary: Colors.transparent,
          surface: Colors.transparent,
          tertiaryContainer: Colors.transparent,
          onTertiaryContainer: Colors.transparent,
          secondaryContainer: Colors.transparent,
        )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return MaxMoneyColor.elevatedButtonBackgroundColor.withOpacity(.5);
          }
          return MaxMoneyColor.elevatedButtonBackgroundColor;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return MaxMoneyColor.elevatedButtonForegroundColor.withOpacity(.5);
          }
          return MaxMoneyColor.elevatedButtonForegroundColor;
        }),
      ),
    ),
  );
  // static ThemeData lightTheme = ThemeData(
  //     useMaterial3: true,
  //     // colorScheme: ColorScheme(
  //     //   brightness: Brightness.light,
  //     //   primary: R.color.primary,
  //     //   background: R.color.scaffoldBackgroundColor,
  //     //   onBackground: R.color.appBarBackgroundColor,
  //     //   secondary: R.color.secondary,
  //     //   error: Colors.transparent,
  //     //   onError: Colors.transparent,
  //     //   onSecondary:
  //     // ),
  //     chipTheme: ChipThemeData(
  //       backgroundColor: R.color.chipColor,
  //       labelStyle: TextStyle(
  //         color: R.color.bodyText1Color,
  //         fontSize: 10,
  //       ),
  //     ),
  //     iconTheme: IconThemeData(
  //       color: R.color.iconColor,
  //     ),
  //     textSelectionTheme:
  //         TextSelectionThemeData(cursorColor: R.color.cursorColor),
  //     // colorScheme: ColorScheme(brightness: Brightness.light, primary: R.color.scaffoldBackgroundColor, onPrimary: onPrimary, secondary: Color(0xFFC78904), onSecondary: Colors.white, error: Colors.red, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
  //     scaffoldBackgroundColor: R.color.scaffoldBackgroundColor,
  //     primaryColor: R.color.primary,
  //     accentColor: R.color.accentColor,
  //     hoverColor: R.color.hoverColor,
  //     appBarTheme: AppBarTheme(
  //       centerTitle: true,
  //       color: R.color.appBarBackgroundColor,
  //       elevation: .5,
  //       titleTextStyle: TextStyle(
  //         fontSize: 18,
  //         fontWeight: FontWeight.w500,
  //         color: R.color.appBarTitleColor,
  //       ),
  //     ),
  //     hintColor: R.color.hintColor,
  //     cardColor: R.color.cardColor,
  //     unselectedWidgetColor: R.color.unselectedWidgetColor,
  //     selectedRowColor: R.color.selectedRowColor,
  //     // colorSchemeSeed: R.color.colorScheme,
  //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //         backgroundColor: R.color.bottomNavigationBarBackgroundColor,
  //         selectedLabelStyle: TextStyle(
  //           fontSize: 10,
  //         ),
  //         unselectedLabelStyle: TextStyle(
  //           fontSize: 10,
  //         ),
  //         selectedItemColor: R.color.primary),
  //     textTheme: TextTheme(
  //       displayLarge: TextStyle(color: R.color.primaryTextColor),
  //       displayMedium: TextStyle(color: R.color.primaryTextColor),
  //       displaySmall: TextStyle(color: R.color.primaryTextColor),
  //       headlineLarge: TextStyle(color: R.color.primaryTextColor),
  //       headlineMedium: TextStyle(color: R.color.primaryTextColor),
  //       headlineSmall: TextStyle(color: R.color.primaryTextColor),
  //       titleLarge: TextStyle(color: R.color.primaryTextColor),
  //       titleMedium: TextStyle(color: R.color.primaryTextColor),
  //       titleSmall: TextStyle(color: R.color.primaryTextColor),
  //       bodyLarge: TextStyle(
  //         color: R.color.bodyLargeColor,
  //         fontSize: 18,
  //       ),
  //       bodyMedium: TextStyle(
  //         color: R.color.bodyLargeColor,
  //         fontSize: 15,
  //       ),
  //       bodySmall: TextStyle(
  //         color: R.color.bodySmallColor,
  //         fontSize: 13,
  //       ),
  //       labelLarge: TextStyle(color: R.color.primaryTextColor),
  //       labelMedium: TextStyle(color: R.color.labelMediumColor, fontSize: 12),
  //       labelSmall: TextStyle(
  //         color: R.color.primaryTextColor,
  //         fontSize: 10,
  //       ),
  //     ),
  //     inputDecorationTheme: InputDecorationTheme(
  //         hintStyle: TextStyle(
  //           color: R.color.inputHintColor,
  //           fontSize: 10,
  //         ),
  //         enabledBorder: InputBorder.none,
  //         border: InputBorder.none,
  //         focusedBorder: InputBorder.none
  //         // enabledBorder: UnderlineInputBorder(
  //         //     borderSide:
  //         //         BorderSide(color: R.color.textFieldBorder, width: .5)),
  //         // focusedBorder: UnderlineInputBorder(
  //         //     borderSide:
  //         //         BorderSide(color: R.color.textFieldBorder, width: .5)),
  //         // border: UnderlineInputBorder(
  //         //     borderSide:
  //         //         BorderSide(color: R.color.textFieldBorder, width: .5))
  //         ),
  //     textButtonTheme: TextButtonThemeData(
  //         style: ButtonStyle(
  //       splashFactory: NoSplash.splashFactory,
  //       foregroundColor: MaterialStateProperty.all(R.color.textButton),
  //       textStyle: MaterialStateProperty.all(
  //           TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
  //     )),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ButtonStyle(
  //           shape: MaterialStateProperty.all(
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
  //           padding:
  //               MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5)),
  //           foregroundColor:
  //               MaterialStateProperty.all(R.color.elevatedButtonTextColor),
  //           textStyle: MaterialStateProperty.resolveWith((states) {
  //             if (states.contains(MaterialState.disabled)) {
  //               return TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.w500,
  //                   color: R.color.diabledEvatedButtonTextColor);
  //             }
  //             return TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  //           }),
  // backgroundColor: MaterialStateProperty.resolveWith((states) {
  //   if (states.contains(MaterialState.disabled)) {
  //     return R.color.disabledElevatedButtonColor;
  //   }
  //   return R.color.elevatedButtonColor;
  // }),
  //           minimumSize: MaterialStateProperty.all(Size.fromHeight(36))),
  //     ),
  //     disabledColor: R.color.diabledEvatedButtonTextColor,
  //     tabBarTheme: TabBarTheme(
  //       labelColor: R.color.tabLabelColor,
  //       unselectedLabelColor: R.color.unselectedLabelColor,
  //       labelStyle: TextStyle(
  //         fontSize: 15,
  //       ),
  //       unselectedLabelStyle: TextStyle(
  //         fontSize: 15,
  //       ),
  //       indicator: UnderlineTabIndicator(
  //           borderSide: BorderSide(color: R.color.primary, width: 4)),
  //       indicatorSize: TabBarIndicatorSize.label,
  //     ),
  //     listTileTheme: ListTileThemeData());

  // static ThemeData dartTheme = lightTheme;
}
