import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_button.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/res/app_icon_button.dart';
import 'package:flutter_demo/res/app_textfield.dart';
import 'package:flutter_demo/utils/app_textstyle.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparentBgColor,
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(AppAssets.loginImage, fit: BoxFit.contain),
          ),

          Positioned.fill(child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.scffoldGradientColorList,
              ),
            ),
          ),),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding / 0.45,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Spacer(flex: 15),

                //Title
                Text(
                  "Sneakers",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppColors.textWhiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                Text(
                  'Special footwear for everyday use',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.textWhiteColor,
                    fontSize: 13.0.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                Spacer(flex: 30),

                //Apptextfield
                AppTextField(
                  hintText: 'Email',
                  color: AppColors.textWhiteColor,
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

                18.verticalSpace,

                //apptextfield2
                AppTextField(
                  hintText: 'Password',
                  color: AppColors.textWhiteColor,
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

                18.verticalSpace,

                //Appbutton
                AppButton(
                  text: 'Sign Up',
                  onPressed: () {},
                  color: AppColors.kPrimaryColor,
                  borderRadius: defaultRadius,
                  textColor: AppColors.textWhiteColor,
                ),

                30.verticalSpace,

                //Social Media Login buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIconButton(
                      icon: SvgPicture.asset(AppAssets.appleLogo),
                      onPressed: () {
                        debugPrint('apple');
                      },
                      color: AppColors.textWhiteColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 3.h,
                      ),
                    ),
                    15.horizontalSpace,
                    AppIconButton(
                      icon: SvgPicture.asset(AppAssets.facebookLogo),
                      onPressed: () {
                        debugPrint('facebook');
                      },
                      color: AppColors.textWhiteColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 3.h,
                      ),
                    ),
                    15.horizontalSpace,
                    AppIconButton(
                      icon: SvgPicture.asset(AppAssets.googleLogo),
                      onPressed: () {
                        debugPrint('google');
                      },
                      color: AppColors.textWhiteColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 3.h,
                      ),
                    ),
                  ],
                ),

                10.verticalSpace,

                //Sign In here text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'If you have an account?',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.textWhiteColor,
                        fontSize: 13.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},

                      child: Text(
                        'Sign In here',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.kPrimaryColor,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),

                Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
