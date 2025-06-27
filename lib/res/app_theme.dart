import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static String myFontFamily = 'Montserrat';
  static String fontFamilyDmsans = 'DM Sans';

  static ThemeData lightMode(BuildContext context, {Color? kPrimaryColor, Color? kBackgroundColor, String? fontFamily}) {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      textTheme: buildTextTheme(base: base.textTheme, myFontFamily: fontFamily),
      primaryTextTheme: buildTextTheme(base: base.primaryTextTheme, myFontFamily: fontFamily),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.transparentBgColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.transparentBgColor,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      iconTheme: IconThemeData(color: AppColors.backgroundgrey),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.kPrimaryColor,
        selectionHandleColor: AppColors.kPrimaryColor,
        cursorColor: AppColors.kPrimaryColor,
      )
    );
  }



  static TextTheme buildTextTheme({required TextTheme base, String? myFontFamily}) {

    return base.copyWith(
      //* Display
      displayLarge: TextStyle(fontSize: (57.0.sp - 2.5), letterSpacing: 0.0, fontWeight: FontWeight.w700, color: base.displayLarge!.color, fontFamily: myFontFamily),
      displayMedium: TextStyle(fontSize: (45.0.sp - 2.5), letterSpacing: 0.0, fontWeight: FontWeight.w700, color: base.displayMedium!.color, fontFamily: myFontFamily),
      displaySmall: TextStyle(fontSize: (36.0.sp - 2.5), letterSpacing: 0.0, fontWeight: FontWeight.w700, color: base.displaySmall!.color, fontFamily: myFontFamily),

      //* Headline
      headlineLarge: TextStyle(fontSize: (32.0.sp - 2.5), letterSpacing: 0.0, fontWeight: FontWeight.w700, color: base.headlineLarge!.color, fontFamily: myFontFamily),
      headlineMedium: TextStyle(fontSize: (28.0.sp - 2.5), letterSpacing: 0.0, fontWeight: FontWeight.w700, color: base.headlineMedium!.color, fontFamily: myFontFamily),
      headlineSmall: TextStyle(fontSize: (20.0.sp - 2.5), letterSpacing: 0.0, fontWeight: FontWeight.w700, color: base.headlineSmall!.color, fontFamily: myFontFamily),

      //* Title
      titleLarge: TextStyle(fontSize: (22.0.sp - 2.5), letterSpacing: 0.0, fontWeight: FontWeight.w700, color: base.titleLarge!.color, fontFamily: myFontFamily),
      titleMedium: TextStyle(fontSize: (16.0.sp - 2.5), letterSpacing: 0.15, fontWeight: FontWeight.w700, color: base.titleMedium!.color, fontFamily: myFontFamily),
      titleSmall: TextStyle(fontSize: (14.0.sp - 2.5), letterSpacing: 0.1, fontWeight: FontWeight.w600, color: base.titleSmall!.color, fontFamily: myFontFamily),

      //* Label
      labelLarge: TextStyle(fontSize: (16.0.sp - 2.5), letterSpacing: 0.1, fontWeight: FontWeight.w700, color: base.labelLarge!.color, fontFamily: myFontFamily),
      labelMedium: TextStyle(fontSize: (12.0.sp - 2.5), letterSpacing: 0.5, fontWeight: FontWeight.w700, color: base.labelMedium!.color, fontFamily: myFontFamily),
      labelSmall: TextStyle(fontSize: (11.0.sp - 2.5), letterSpacing: 0.5, fontWeight: FontWeight.w700, color: base.labelSmall!.color, fontFamily: myFontFamily),

    );
  }
}