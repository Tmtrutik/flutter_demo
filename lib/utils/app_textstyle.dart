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
}
