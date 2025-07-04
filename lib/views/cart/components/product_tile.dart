import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/res/app_theme.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/views/cart/cart_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final CartController cartcon = Get.find<CartController>();
  final String title;
  final int price;
  final double rating;
  final String reviews;
  final String image;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  ProductTile({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.image,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 120.w,
              height: 125.w,
            ),
          ),

          12.horizontalSpace,

          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.sp,
                  ),
                ),
                Text(
                    "\$$price",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      fontFamily: AppTheme.fontFamilyDmsans,
                    ),
                  ),
                5.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: onDecrement,
                          child: SvgPicture.asset(
                            AppAssets.msymbolSvg,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                        10.horizontalSpace,
                        SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Text(
                            quantity.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: onIncrement,
                          child: SvgPicture.asset(
                            AppAssets.psymbolSvg,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: onRemove,
                      borderRadius: BorderRadius.circular(defaultRadius),
                      child: SvgPicture.asset(
                        AppAssets.trashSvg,
                        height: 15.h,
                        width: 15.w,
                        colorFilter: ColorFilter.mode(
                          AppColors.greyColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                9.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.starSvg,
                          height: 7.h,
                          width: 7.w,
                        ),

                        3.horizontalSpace,

                        Text(
                          rating.toString(),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                        ),

                        15.horizontalSpace,

                        Text(
                          reviews,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                        ),
                      ],
                    ),

                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(defaultRadius),
                      child: SvgPicture.asset(
                        AppAssets.moreSvg,
                        height: 15.h,
                        width: 15.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
