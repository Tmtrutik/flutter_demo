import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentTile extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final Widget icon;
  final Color? color;

  const PaymentTile({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: isSelected ? 4 : 0,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          width: 90.w,
          height: 55.h,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.kPrimaryColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.blackColor.withAlpha(25),
                      offset: Offset(0, 3),
                      blurRadius: 4,
                    ),
                  ]
                : [],
          ),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
