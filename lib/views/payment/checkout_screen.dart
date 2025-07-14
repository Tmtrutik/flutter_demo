import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/res/app_button.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/res/app_icon_button.dart';
import 'package:flutter_demo/res/app_textfield.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:flutter_demo/utils/app_textstyle.dart';
import 'package:flutter_demo/utils/routes/app_routes.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/views/payment/checkout_controller.dart';
import 'package:flutter_demo/views/payment/components/payment_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final CheckoutController con = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        // leading
        leading: AppIconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppAssets.backarrowSvg),
        ),

        // title
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,

        // actions
        actions: [
          AppIconButton(
            icon: SvgPicture.asset(AppAssets.homeSvg),
            onPressed: () {
              Get.toNamed(AppRoutes.homeScreen);
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              defaultPadding.verticalSpace,

              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.backgroundgrey,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultPadding.verticalSpace,
                      Text(
                        'Mode of Payment',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                      12.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PaymentTile(
                            isSelected: con.selectedMethod.value == 'card',
                            onTap: () {
                              con.selectMethod('card');
                            },
                            icon: Image.asset(
                              AppAssets.cardPng,
                              fit: BoxFit.cover,
                              width: 45.w,
                              height: 40.h,
                              color: con.selectedMethod.value == 'card'
                                  ? AppColors.whiteColor
                                  : AppColors.kPrimaryColor,
                            ),
                          ),
                          PaymentTile(
                            isSelected: con.selectedMethod.value == 'paypal',
                            onTap: () {
                              con.selectMethod('paypal');
                            },
                            icon: Image.asset(
                              AppAssets.paypalPng,
                              fit: BoxFit.cover,
                              width: 35.w,
                              height: 35.h,
                            ),
                          ),
                          PaymentTile(
                            isSelected: con.selectedMethod.value == 'applepay',
                            onTap: () {
                              con.selectMethod('applepay');
                            },
                            icon: Image.asset(
                              AppAssets.applepayPng,
                              fit: BoxFit.cover,
                              width: 45.w,
                              height: 40.h,
                            ),
                          ),
                        ],
                      ),
                      30.verticalSpace,
                      Text(
                        'Card number',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),

                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                          CardNumberInputFormatter(),
                        ],
                        controller: con.cardNumberController,
                        onChanged: (val) => con.cardNumber.value = val,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: Image.asset(
                              AppAssets.mastercardPng,
                              fit: BoxFit.fitWidth,
                              width: 20.w,
                              height: 15.h,
                            ),
                          ),
                          filled: true,
                          fillColor: AppColors.tfbgcolor,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                          hintText: '0000 0000 0000 0000',
                          hintStyle: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 17.sp,
                                color: AppColors.hintTextColor,
                              ),
                        ),
                      ),
                      con.cardNumberError.value.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                top: 4.0,
                              ),
                              child: Text(
                                con.cardNumberError.value,
                                style: AppTextStyle.textFieldStyle(context)
                                    ?.copyWith(
                                      color: AppColors.redColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            )
                          : SizedBox.shrink(),

                      15.verticalSpace,

                      Text(
                        "Cardholder's name",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),

                      5.verticalSpace,

                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: con.cardHolderNameController,
                        onChanged: (val) => con.cardHolderName.value = val,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.tfbgcolor,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Name',
                          hintStyle: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 17.sp,
                                color: AppColors.hintTextColor,
                              ),
                        ),
                      ),
                      con.cardHolderError.value.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                top: 4.0,
                              ),
                              child: Text(
                                con.cardHolderError.value,
                                style: AppTextStyle.textFieldStyle(context)
                                    ?.copyWith(
                                      color: AppColors.redColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            )
                          : SizedBox.shrink(),

                      15.verticalSpace,

                      Row(
                        children: [
                          Text(
                            'Expiry date',
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                ),
                          ),
                          65.horizontalSpace,
                          Text(
                            'CVV',
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                ),
                          ),
                        ],
                      ),

                      5.verticalSpace,

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(6),
                                    ExpiryDateInputFormatter(),
                                  ],
                                  controller: con.expiryDateController,
                                  onChanged: (val) {
                                    con.expiryDate.value = val;
                                    if (val.length == 5) {
                                      final parts = val.split('/');
                                      if (parts.length == 2) {
                                        final year = int.tryParse(parts[1]);
                                        if (year != null) {
                                          final currentYear =
                                              DateTime.now().year % 100;
                                          if (year > currentYear + 10) {
                                            con.expiryDateError.value =
                                                'Year is too far';
                                          } else {
                                            con.expiryDateError.value = '';
                                          }
                                        }
                                      }
                                    } else {
                                      con.expiryDateError.value = '';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.tfbgcolor,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 18.w,
                                      vertical: 10.h,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'MM / YY',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17.sp,
                                          color: AppColors.hintTextColor,
                                        ),
                                  ),
                                ),
                                con.expiryDateError.value.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                          top: 4.0,
                                        ),
                                        child: Text(
                                          con.expiryDateError.value,
                                          style:
                                              AppTextStyle.textFieldStyle(
                                                context,
                                              )?.copyWith(
                                                color: AppColors.redColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ),

                          20.horizontalSpace,

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  controller: con.cvvController,
                                  onChanged: (val) => con.cvv.value = val,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.tfbgcolor,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 18.w,
                                      vertical: 10.h,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: '3 digits',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17.sp,
                                          color: AppColors.hintTextColor,
                                        ),
                                  ),
                                ),
                                con.cvvError.value.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                          top: 4.0,
                                        ),
                                        child: Text(
                                          con.cvvError.value,
                                          style:
                                              AppTextStyle.textFieldStyle(
                                                context,
                                              )?.copyWith(
                                                color: AppColors.redColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                          textAlign: TextAlign.start,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ],
                      ),

                      20.verticalSpace,
                    ],
                  ),
                ),
              ),

              30.verticalSpace,

              Text(
                'Check your email to confirm \n payment from your Bank',
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),

              30.verticalSpace,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: AppButton(
                  text: 'Complete Payment',
                  textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 18.sp,
                    color: AppColors.whiteColor,
                  ),
                  width: Get.width,
                  height: 60.h,
                  onPressed: () {
                    con.validate();
                  },
                  color: AppColors.kPrimaryColor,
                  borderRadius: defaultRadius,
                  textColor: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
