import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.hintStyle,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding/18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.hintTextColor,
          width: 1,
        )
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: icon,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: defaultPadding/1.3),
              child: TextField(
                keyboardType: TextInputType.text,
                cursorColor: AppColors.kPrimaryColor,
                obscureText: obscureText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: hintStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
