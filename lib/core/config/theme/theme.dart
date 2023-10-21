import 'package:flutter/material.dart';
import 'package:weathapp/core/config/theme/app_colors.dart';
import 'package:weathapp/core/config/theme/size.dart';

/// this class is used to set the app theme data and colors for the app
class AppTheme {
  /// this method is used to get the app theme data
  static ThemeData get appTheme => ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
        useMaterial3: false,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: AppColor.primaryColor,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.backgroundColor,
          foregroundColor: AppColor.primaryColor,
          elevation: 4,
          splashColor: AppColor.primaryColor,
          hoverColor: AppColor.primaryColor,
          focusColor: AppColor.primaryColor,
          hoverElevation: 4,
          focusElevation: 4,
          iconSize: 36,
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColor.primaryColor),
          overlayColor: MaterialStateProperty.all(AppColor.primaryColor),
          splashRadius: 24,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(designRadius18),
            ),
            padding: const EdgeInsets.all(12),
            shadowColor: const Color(0xff6C5DD3),
            elevation: 4,
            foregroundColor: Colors.white,
            minimumSize: Size(width, 55),
            maximumSize: Size(width, 56),
            disabledForegroundColor: Colors.white,
            disabledBackgroundColor: const Color(0xff94A3B8),
            backgroundColor: AppColor.primaryColor,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(designRadius18),
            ),
            side: BorderSide(color: AppColor.primaryColor),
            padding: const EdgeInsets.all(12),
            foregroundColor: AppColor.primaryColor,
            minimumSize: Size(width, 48),
          ),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColor.primaryColor,
          onPrimary: AppColor.backgroundColor,
          secondary: AppColor.primaryColor,
          onSecondary: AppColor.backgroundColor,
          error: AppColor.backgroundColor,
          onError: AppColor.backgroundColor,
          background: AppColor.backgroundColor,
          onBackground: AppColor.backgroundColor,
          surface: AppColor.backgroundColor,
          onSurface: AppColor.backgroundColor,
        ),
      );
}
