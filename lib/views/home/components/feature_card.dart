import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: Container(
            padding: EdgeInsets.only(left: 150.w, right: 16.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text content
                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Converse\nAll-Stars\nVibes',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.blackColor,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: (){debugPrint('Shop now');},
                          child: Text(
                            'Shop now',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.kPrimaryColor,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        4.horizontalSpace,
                        SvgPicture.asset(AppAssets.arrowSvg),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    
        //Image
        Positioned(
          left: -20.w,
          top: -110.h,
          child: SizedBox(
            width: 300.w,
            height: 300.h,
            child: Image.asset(
              AppAssets.fsneakers,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}