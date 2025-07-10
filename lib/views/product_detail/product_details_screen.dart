import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_button.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/res/app_icon_button.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/views/product_detail/product_details_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  final ProductDetailsController con = Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: AppColors.backgroundgrey,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        leading: AppIconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppAssets.backarrowSvg),
        ),
        title: Text(
          'Product Detail',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
        ),
      ),
      body: ListView(
        physics: RangeMaintainingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultRadius * 2),
            child: Image.asset(
              product['image'],
              height: 1.1.sw,
              width: Get.width,
              fit: BoxFit.fill,
            ),
          ).paddingOnly(bottom: defaultPadding),
          Container(
            margin: EdgeInsets.only(bottom: defaultPadding),
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product['name'],
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16.sp),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '\t${product['price']}\n',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      WidgetSpan(
                        child: SvgPicture.asset(AppAssets.starSvg),
                      ),
                      TextSpan(
                        text: ' ${product['rating']} ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Text('Discover the perfect blend of fashion and functionality with our latest sneaker release. Crafted with breathable mesh fabric and premium cushioning, these shoes are designed to keep up with your active lifestyle while elevating your everyday look. '),
          ),
        ],
      ),
      bottomNavigationBar: AppButton(
        text: 'Add To Cart',
        onPressed: () {},
        color: AppColors.kPrimaryColor,
      ).paddingOnly(bottom: defaultPadding * 2, right: defaultPadding, left: defaultPadding),
    );
  }
}
