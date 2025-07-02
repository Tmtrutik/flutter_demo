import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_button.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/res/app_icon_button.dart';
import 'package:flutter_demo/res/app_textfield.dart';
import 'package:flutter_demo/utils/app_textstyle.dart';
import 'package:flutter_demo/utils/routes/app_routes.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(AppAssets.loginImage, fit: BoxFit.cover),
          ),

          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.scffoldGradientColorList,
              ),
            ),
          ),

          // Main Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 0.45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80.h),
            
                // Title
                Column(
                  children: [
                    Text(
                      "Sneakers",
                      style: AppTextStyle.titleStyle(
                        context,
                      )?.copyWith(fontSize: 45.0.sp),
                    ),
                    // SizedBox(height: 0.75.h),
                    Text(
                      'Special footwear for everyday use',
                      style: AppTextStyle.subtitleStyle(
                        context,
                      )?.copyWith(fontSize: 14.0.sp),
                    ),
                  ],
                ),
            
                Spacer(),
            
                // Form Section
                Column(
                  children: [
                    // Email TextField
                    AppTextField(
                      hintText: 'Email',
                      color: AppColors.whiteColor,
                      hintStyle: AppTextStyle.textFieldStyle(
                        context,
                      )?.copyWith(fontWeight: FontWeight.w300),
                      icon: SvgPicture.asset(
                        AppAssets.mailSvg,
                        colorFilter: ColorFilter.mode(
                          AppColors.hintTextColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
            
                    SizedBox(height: 18.h),
            
                    // Password TextField
                    AppTextField(
                      hintText: 'Password',
                      color: AppColors.whiteColor,
                      obscureText: true,
                      hintStyle: AppTextStyle.textFieldStyle(
                        context,
                      )?.copyWith(fontWeight: FontWeight.w300),
                      icon: SvgPicture.asset(
                        AppAssets.lockSvg,
                        colorFilter: ColorFilter.mode(
                          AppColors.hintTextColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
            
                    SizedBox(height: 18.h),
            
                    // Sign Up Button
                    AppButton(
                      text: 'Sign Up',
                      width: Get.width,
                      onPressed: () {
                        Get.toNamed(AppRoutes.homeScreen);
                      },
                      color: AppColors.kPrimaryColor,
                      borderRadius: defaultRadius,
                      textColor: AppColors.whiteColor,
                    ),
                  ],
                ),
            
                SizedBox(height: 30.h),
            
                // Social Media Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIconButton(
                      icon: SvgPicture.asset(AppAssets.appleLogo),
                      onPressed: () {
                        debugPrint('apple login pressed');
                      },
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(defaultRadius),
                      padding: EdgeInsets.all(defaultPadding / 5),
                    ),
            
                    SizedBox(width: 15.w),
            
                    AppIconButton(
                      icon: SvgPicture.asset(AppAssets.facebookLogo),
                      onPressed: () {
                        debugPrint('facebook login pressed');
                      },
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(defaultRadius),
                      padding: EdgeInsets.all(defaultPadding / 5),
                    ),
            
                    SizedBox(width: 15.w),
            
                    AppIconButton(
                      icon: SvgPicture.asset(AppAssets.googleLogo),
                      onPressed: () {
                        debugPrint('google login pressed');
                      },
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(defaultRadius),
                      padding: EdgeInsets.all(defaultPadding / 5),
                    ),
                  ],
                ),
            
                SizedBox(height: 30.h),
            
                // Sign In Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'If you have an account? ',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Sign In here',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.kPrimaryColor,
                          color: AppColors.kPrimaryColor,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
            
                SizedBox(height: 35.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
