import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/utils/utils.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? color;
  final Widget? icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    required this.hintText,
    this.color,
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
        color: color,
        borderRadius: BorderRadius.circular(defaultRadius),
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
