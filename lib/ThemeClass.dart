import 'package:flutter/material.dart';

class ThemeApp {
  final Locale _locale;
  static const String defaultFontFamili = 'Avenir';
  static const primaryTextColor = Color(0xff0D253C);
  static const Color secondaryTextColor = Color(0xff2D4379);

  ThemeApp(this._locale);

  ThemeData get LightTheme => ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: ColorScheme.light().background,
          foregroundColor: ColorScheme.light().onBackground),
      snackBarTheme:
          SnackBarThemeData(backgroundColor: ColorScheme.light().primary),
      scaffoldBackgroundColor: ThemeData.light().scaffoldBackgroundColor,
      colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: Color(0xff376AED),
          background: Color(0xffF8FAFF),
          onBackground: Colors.black,
          onSurface: Colors.white),
      textTheme: _locale.languageCode == 'en'
          ? ThemeApp.enlishTextTheme
          : ThemeApp.farsiTextTheme);

  ThemeData get DarkTheme => ThemeData(
      scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      colorScheme:
          ThemeData.dark().colorScheme.copyWith(primary: Color(0xff376AED)),
      textTheme: _locale.languageCode == 'en'
          ? ThemeApp.enlishTextTheme
          : ThemeApp.farsiTextTheme);

  static TextTheme get farsiTextTheme =>
      const TextTheme(bodyMedium: TextStyle(fontSize: 50));

  static TextTheme get enlishTextTheme => const TextTheme(
      titleSmall: TextStyle(
          fontSize: 18,
          fontFamily: defaultFontFamili,
          color: secondaryTextColor),
      titleMedium: TextStyle(
          fontSize: 24,
          fontFamily: defaultFontFamili,
          color: primaryTextColor,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: defaultFontFamili,
      ),
      labelLarge: TextStyle(
          fontSize: 20,
          fontFamily: defaultFontFamili,
          fontWeight: FontWeight.w700),
      labelMedium: TextStyle(
          fontSize: 14,
          fontFamily: defaultFontFamili,
          fontWeight: FontWeight.w400,
          color: secondaryTextColor),
      labelSmall: TextStyle(
          fontSize: 12,
          fontFamily: defaultFontFamili,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontSize: 10,
          fontFamily: defaultFontFamili,
          fontWeight: FontWeight.w700,
          color: Color(0xff376AED)),
      displaySmall: TextStyle(
          fontSize: 14,
          fontFamily: defaultFontFamili,
          fontWeight: FontWeight.w200));
}
