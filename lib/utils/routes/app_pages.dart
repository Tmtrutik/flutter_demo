import 'package:flutter_demo/utils/routes/app_routes.dart';
import 'package:flutter_demo/views/login_screen.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    
    GetPage(name: AppRoutes.loginScreen, page: ()=> LoginScreen()),
  ];
}
