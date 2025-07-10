import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/data/firebase/firebase_options.dart';
import 'package:flutter_demo/res/app_colors.dart';
import 'package:flutter_demo/res/app_theme.dart';
import 'package:flutter_demo/utils/app_strings.dart';
import 'package:flutter_demo/utils/local_storage.dart';
import 'package:flutter_demo/utils/routes/app_pages.dart';
import 'package:flutter_demo/utils/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init('localData');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightMode(
            context,
            kPrimaryColor: AppColors.kPrimaryColor,
            kBackgroundColor: AppColors.backgroundLight,
            fontFamily: AppTheme.myFontFamily,
          ),
          themeMode: ThemeMode.light,
          getPages: AppPages.pages,
          initialRoute: LocalStorage.isLoggedIn ? AppRoutes.homeScreen : AppRoutes.loginScreen,
        );
      },
    );
  }
}
