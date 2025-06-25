import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_icon_button.dart';
import 'package:flutter_demo/res/app_button.dart';
import 'package:flutter_demo/res/app_colors.dart';
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
      appBar: AppBar(
        title: Text(
          'Sneakers',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actionsPadding: EdgeInsets.only(right: defaultPadding),
        actions: [
          AppIconButton(
            icon: SvgPicture.asset(AppAssets.menuSvg),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 0.45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            //Apptextfield
            AppTextField(
              hintText: 'Email',
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

            20.verticalSpace,

            //apptextfield2
            AppTextField(
              hintText: 'Password',
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

            20.verticalSpace,

            //Appbutton
            AppButton(
              text: 'Sign Up',
              onPressed: () {},
              color: AppColors.kPrimaryColor,
              borderRadius: defaultRadius,
              textColor: AppColors.textWhiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
