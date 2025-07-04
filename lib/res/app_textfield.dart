import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/utils/utils.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? color;
  final Widget? icon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    required this.hintText,
    this.color,
    required this.icon,
    this.hintStyle,
    this.obscureText,
    this.keyboardType,
    this.controller,
    this.suffixIcon,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(defaultRadius),
        border: Border.all(color: AppColors.hintTextColor, width: 1),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: icon,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: defaultPadding / 1.3),
              child: TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                obscureText: obscureText ?? false,
                validator: validator,
                onChanged: onChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: hintStyle,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: defaultPadding / 2),
            child: suffixIcon,
          )
        ],
      ),
    );
  }
}
