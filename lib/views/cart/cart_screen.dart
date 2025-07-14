import 'package:flutter/material.dart';
import 'package:flutter_demo/res/app_button.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/res/app_icon_button.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:flutter_demo/utils/color_print.dart';
import 'package:flutter_demo/utils/routes/app_routes.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/views/cart/cart_controller.dart';
import 'package:flutter_demo/views/cart/components/confirm_clear_dialog.dart';
import 'package:flutter_demo/views/cart/components/product_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final CartController con = Get.put(CartController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    printWhite(con.cartProducts.toString());
    return Scaffold(
      appBar: AppBar(
        // leading
        leading: AppIconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppAssets.backarrowSvg),
        ),

        // title
        title: Text(
          'Shopping Cart',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700, fontSize: 16.sp),
        ),
        centerTitle: true,

        // actions
        actions: [
          Obx(
            () => con.isCartEmpty.value
                ? SizedBox.shrink()
                : AppIconButton(
                    icon: SvgPicture.asset(AppAssets.trashSvg),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ConfirmClearDialog(
                          onConfirm: () {
                            Get.back();
                            con.clearCart();
                          },
                          onCancel: () {
                            Get.back();
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: RangeMaintainingScrollPhysics(),
              child: Column(
                children: [
                  30.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: con.cartProducts.length,
                        separatorBuilder: (context, index) => SizedBox(height: 30),
                        itemBuilder: (context, index) {
                          final product = con.cartProducts[index];
                          return ProductTile(
                            image: product.image ?? '',
                            title: product.name ?? '',
                            price: int.tryParse(product.price ?? '0') ?? 0,
                            rating: double.tryParse(product.rating ?? '0') ?? 0,
                            reviews: '',
                            quantity: product.quantity ?? 1,
                            onIncrement: () => con.incrementQuantity(index),
                            onDecrement: () => con.decrementQuantity(index),
                            onRemove: () => con.removeItem(index),
                          );
                        },
                      ),
                    ),
                  ),
                  70.verticalSpace,
                ],
              ),
            ),
          ),
          Obx(
            () => Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundgrey,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    30.verticalSpace,
                    Row(
                      children: [
                        24.horizontalSpace,
                        Text(
                          'Total: ${con.totalItems} items',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                color: AppColors.greyColor,
                              ),
                        ),
                        Spacer(),
                        Text(
                          'USD ${con.totalPrice.toString()}',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    AppButton(
                      text: 'Proceed to Checkout',
                      icon: SvgPicture.asset(
                        AppAssets.rightarrowSvg,
                        colorFilter: ColorFilter.mode(
                          AppColors.whiteColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      width: Get.width,
                      onPressed: () {
                        Get.toNamed(AppRoutes.checkoutScreen);
                      },
                      color: AppColors.kPrimaryColor,
                      borderRadius: defaultRadius,
                      textColor: AppColors.whiteColor,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
