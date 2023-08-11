import 'package:cinereserve/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:cinereserve/constants/app_fonts.dart';

class NativeThemeData {
  ThemeData nativeLightTheme() {
    return ThemeData.light().copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            // TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            // TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            // TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
          },
        ),
        // useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F6FA),
        primaryColor: white,
        inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.black),
            counterStyle: TextStyle(color: Colors.black)),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontFamily: AppFonts.poppinsRegular,
            fontWeight: FontWeight.w800,
            fontSize: 40,
            color: const Color.fromRGBO(34, 34, 34, 1),
          ),
          bodyMedium: TextStyle(
            fontFamily: AppFonts.poppinsRegular,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: const Color.fromRGBO(34, 34, 34, 1),
          ),
          bodySmall: TextStyle(
            fontFamily: AppFonts.poppinsRegular,
            fontWeight: FontWeight.w400,
            fontSize: 8,
            color: const Color.fromRGBO(34, 34, 34, 1),
          ),
          displayMedium: TextStyle(
            fontFamily: AppFonts.poppinsRegular,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: const Color.fromRGBO(34, 34, 34, 1),
          ),
        ));
  }
}
