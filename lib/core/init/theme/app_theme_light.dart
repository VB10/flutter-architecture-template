import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  // ThemeData get theme => redTheme;
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        inputDecorationTheme: InputDecorationTheme(
            focusColor: Colors.black12,
            labelStyle: TextStyle(),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red))),
        scaffoldBackgroundColor: Color(0xfff1f3f8),
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
        tabBarTheme: tabBarTheme(),
      );

  TabBarTheme tabBarTheme() {
    return TabBarTheme(
      labelPadding: insets.lowPaddingAll,
      unselectedLabelStyle: textThemeLight.headline4.copyWith(color: colorSchemeLight.red),
    );
  }

  TextTheme textTheme() {
    return TextTheme(headline1: textThemeLight.headline1, headline2: textThemeLight.headline2, overline: textThemeLight.headline3);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: colorSchemeLight.black,
        primaryVariant: Colors.white, //xx
        secondary: Colors.green,
        secondaryVariant: colorSchemeLight.azure,
        surface: Colors.blue,
        background: Colors.white,
        error: Colors.red[900],
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black, //x
        onSurface: Colors.white30,
        onBackground: Colors.black12,
        onError: Color(0xffffc93c), //xx
        brightness: Brightness.light);
  }
}
