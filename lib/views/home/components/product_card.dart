import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/res/app_theme.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProductCard extends StatelessWidget {
  final dynamic product;
  final Alignment? imageAlignment;
  final VoidCallback? onTap;
  const ProductCard({super.key, required this.product,this.imageAlignment, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      width: 130.w,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: AppColors.whiteColor,
          clipBehavior: Clip.antiAlias,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
              child: SizedBox(  
                height: 108.h,
                width: Get.width,
                child: Image.asset(
                  product['image'],
                  fit: BoxFit.cover,
                  alignment: product['imageAlignment'] ?? Alignment.topCenter,
                ),
              ),
            ),
        
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2,
                  vertical: defaultPadding / 1.3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'],
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                    ),
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product['price'],
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackColor,
                            fontFamily: AppTheme.fontFamilyDmsans,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.starSvg),
                            3.horizontalSpace,
                            Text(
                              product['rating'].toString(),
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackColor,
                                    fontFamily: AppTheme.fontFamilyDmsans,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
