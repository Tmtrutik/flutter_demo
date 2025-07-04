import 'package:flutter_demo/utils/routes/app_routes.dart';
import 'package:flutter_demo/views/cart/cart_screen.dart';
import 'package:flutter_demo/views/home/home_screen.dart';
import 'package:flutter_demo/views/auth/login_screen.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(name: AppRoutes.homeScreen, page: ()=> HomeScreen()),
    GetPage(name: AppRoutes.loginScreen, page: ()=> LoginScreen()),
    GetPage(name: AppRoutes.cartScreen, page: ()=> CartScreen()),

  ];
}
