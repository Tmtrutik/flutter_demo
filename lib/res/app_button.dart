import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Widget? icon;
  final MainAxisAlignment? mainAxisAlignment;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.width,
    this.height,
    this.icon,
    this.mainAxisAlignment,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(defaultPadding),
          backgroundColor: color,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle ?? Theme.of( 
                context,
              ).textTheme.labelLarge?.copyWith(color: AppColors.whiteColor),
            ),
            if (icon != null)
              SizedBox(
                width: 20.w,
                height: 20.h,
                child: icon,
              ),
          ],
        ),
      ),
    );
  }
}
