import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    fontFamily: 'Outfit',
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.white,
        onPrimary: Appcolors.redPrimary,
        secondary: Appcolors.redSecondary,
        onSecondary: Colors.white,
        error: Appcolors.redError,
        onError: Appcolors.blackText,
        background: Colors.white,
        onBackground: Appcolors.blackText,
        surface: Colors.white,
        onSurface: Appcolors.blackText),
    iconTheme: const IconThemeData(color: Appcolors.greyPrimary),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(color: Colors.white),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 15),
              
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(Appcolors.redPrimary),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ))),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Appcolors.blackText,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Appcolors.greyText,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Appcolors.blackText,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Appcolors.blackText,
      ),
      titleMedium: TextStyle(
          fontSize: 16,
          color: Appcolors.greyPrimary,
          fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(
          fontSize: 14,
          color: Appcolors.blackText,
          fontWeight: FontWeight.w400),
      titleSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Appcolors.redSecondary,
      ),
      bodySmall: TextStyle(
          fontSize: 15, color: Appcolors.greyText, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(
          fontSize: 12,
          color: Appcolors.greySmallText,
          fontWeight: FontWeight.w500),
      displaySmall: TextStyle(
          fontSize: 12,
          color: Appcolors.redSecondary,
          fontWeight: FontWeight.w700),
      labelSmall: TextStyle(
          fontSize: 9,
          color: Appcolors.greySmallText,
          fontWeight: FontWeight.w500),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Appcolors.redPrimary,
      unselectedItemColor: Appcolors.greySmallText,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            color: Appcolors.blackText,
            fontSize: 18,
            fontWeight: FontWeight.w700)),
  );
  static final darkTheme = lightTheme.copyWith();
}
