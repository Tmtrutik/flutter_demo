import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_button.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/res/app_icon_button.dart';
import 'package:flutter_demo/res/app_textfield.dart';
import 'package:flutter_demo/utils/app_textstyle.dart';
import 'package:flutter_demo/utils/color_print.dart';
import 'package:flutter_demo/utils/routes/app_routes.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(AppAssets.loginImage, fit: BoxFit.cover),
          ),

          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.scffoldGradientColorList,
                ),
              ),
            ),
          ),

          // Main Content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 0.45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  100.verticalSpace,

                  // Title
                  Column(
                    children: [
                      Text(
                        "Sneakers",
                        style: AppTextStyle.titleStyle(
                          context,
                        )?.copyWith(fontSize: 45.0.sp),
                      ),
                      Text(
                        'Special footwear for everyday use',
                        style: AppTextStyle.subtitleStyle(
                          context,
                        )?.copyWith(fontSize: 14.0.sp),
                      ),
                    ],
                  ),

                  200.verticalSpace,

                  // Form Section
                  Obx(
                    () => Column(
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
                          controller: controller.emailController,
                          onChanged: (val) => controller.email.value = val,
                        ),
                        controller.emailError.value.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  top: 4.0,
                                ),
                                child: Text(
                                  controller.emailError.value,
                                  style: AppTextStyle.textFieldStyle(context)
                                      ?.copyWith(
                                        color: AppColors.redColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : SizedBox.shrink(),

                        18.verticalSpace,

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
                          controller: controller.passwordController,
                          onChanged: (val) => controller.password.value = val,
                        ),
                        controller.passwordError.value.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  top: 4.0,
                                ),
                                child: Text(
                                  controller.passwordError.value,
                                  style: AppTextStyle.textFieldStyle(context)
                                      ?.copyWith(
                                        color: AppColors.redColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : SizedBox.shrink(),

                        18.verticalSpace,

                        // Sign Up Button
                        AppButton(
                          text: 'Sign Up',
                          width: Get.width,
                          onPressed: () {
                            if (controller.validate()) {
                              Get.toNamed(AppRoutes.homeScreen);
                            }
                          },
                          color: AppColors.kPrimaryColor,
                          borderRadius: defaultRadius,
                          textColor: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ),

                  30.verticalSpace,

                  // Social Media Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIconButton(
                        icon: SvgPicture.asset(AppAssets.appleLogo),
                        onPressed: () {
                          printWhite('apple login pressed');
                        },
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(defaultRadius),
                        padding: EdgeInsets.all(defaultPadding / 5),
                      ),

                      15.horizontalSpace,

                      AppIconButton(
                        icon: SvgPicture.asset(AppAssets.facebookLogo),
                        onPressed: () {
                          printWhite('facebook login pressed');
                        },
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(defaultRadius),
                        padding: EdgeInsets.all(defaultPadding / 5),
                      ),

                      15.horizontalSpace,

                      AppIconButton(
                        icon: SvgPicture.asset(AppAssets.googleLogo),
                        onPressed: () {
                          printWhite('google login pressed');
                        },
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(defaultRadius),
                        padding: EdgeInsets.all(defaultPadding / 5),
                      ),
                    ],
                  ),

                  30.verticalSpace,

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
                        onTap: () {
                          printWhite('sign in here pressed');
                        },
                        child: Text(
                          'Sign In here',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
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

                  32.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
