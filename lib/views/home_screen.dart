import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/res/app_icon_button.dart';
import 'package:flutter_demo/res/app_textfield.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:flutter_demo/utils/app_textstyle.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Sneakers',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 19.sp,
          ),
        ),
        centerTitle: true,
        leading: AppIconButton(
          onPressed: () {},
          padding: EdgeInsets.all(5.0),
          icon: CircleAvatar(backgroundImage: AssetImage(AppAssets.profileJpg)),
        ),
        actions: [
          AppIconButton(
            icon: SvgPicture.asset(AppAssets.menuSvg),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              'Hello, Funke',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              'What are you looking for today?',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 22.sp,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 20.h),
            AppTextField(
              hintText: 'Search sneakers',
              hintStyle: AppTextStyle.textFieldStyle(context)?.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 13.sp,
                color: AppColors.hintTextColor,
              ),
              icon: SvgPicture.asset(AppAssets.searchSvg),
              suffixIcon: SvgPicture.asset(AppAssets.micSvg),
            ),
            
          ],
        ),
      ),
    );
  }
}
