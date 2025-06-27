import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle? textFieldStyle(BuildContext context, {Color? color}) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontSize: 14.0.sp,
      color: AppColors.hintTextColor,
      fontFamily: 'Montserrat',
    );
  }

  static TextStyle appButtonStyle(BuildContext context) {
    return TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600);
  }

  static TextStyle? titleStyle(BuildContext context, {Color? color}) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(
      fontSize: 45.0.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.whiteColor,
    );
  }

  static TextStyle? subtitleStyle(
    BuildContext context, {
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
  }) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    );
  }
}
