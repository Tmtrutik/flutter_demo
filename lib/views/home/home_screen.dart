import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/res/app_icon_button.dart';
import 'package:flutter_demo/res/app_textfield.dart';
import 'package:flutter_demo/res/app_theme.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:flutter_demo/utils/app_textstyle.dart';
import 'package:flutter_demo/utils/local_storage.dart';
import 'package:flutter_demo/utils/routes/app_routes.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/views/home/components/feature_card.dart';
import 'package:flutter_demo/views/home/components/product_card.dart';
import 'package:flutter_demo/views/home/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // App Bar
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,

          // leading
          leading: AppIconButton(
            onPressed: () {},
            padding: EdgeInsets.all(5.0),
            icon: CircleAvatar(
              backgroundImage: AssetImage(AppAssets.profileJpg),
            ),
          ),

          // title
          title: Text(
            'Sneakers',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 19.sp,
                ),
          ),
          centerTitle: true,

          // actions
          actions: [
            AppIconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 20,
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.cartScreen);
              },
            ),
            AppIconButton(
              icon: SvgPicture.asset(AppAssets.menuSvg),
              onPressed: () {},
            ),
          ],
        ),

        // Main Body
        body: CustomScrollView(
          physics: RangeMaintainingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'Hello, ${LocalStorage.userName}',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
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
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundgrey,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  child: Column(
                    children: [
                      25.verticalSpace,
                      SizedBox(
                        height: 25.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => 6.horizontalSpace,
                          itemCount: con.brands.length,
                          itemBuilder: (context, index) {
                            String category = con.brands[index];
                            return Obx(
                              () => GestureDetector(
                                onTap: () => con.selectBrand(category),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: con.selectedBrand.value == category ? AppColors.kPrimaryColor : AppColors.backgroundgrey,
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      category,
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            fontFamily: AppTheme.fontFamilyDmsans,
                                            color: con.selectedBrand.value == category ? AppColors.whiteColor : AppColors.greyColor,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      18.verticalSpace,
                      SizedBox(
                        height: 160.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => 15.horizontalSpace,
                          itemCount: con.productInfo.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              product: con.productInfo[index],
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                      15.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Featured Products',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: AppColors.blackColor,
                                ),
                          ),
                          Text(
                            'See All',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: AppColors.hintTextColor,
                                ),
                          ),
                        ],
                      ),
                      15.verticalSpace,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 140.h,
                              width: 280.w,
                              child: FeatureCard(),
                            ),
                            15.horizontalSpace,
                            SizedBox(
                              height: 140.h,
                              width: 280.w,
                              child: FeatureCard(),
                            ),
                          ],
                        ),
                      ),
                      25.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
