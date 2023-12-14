import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/app_theme.dart';
import 'package:tfg_frontend/app/modules/splash_screen/splash_screen_binding.dart';
import 'package:tfg_frontend/app/modules/splash_screen/splash_screen_page.dart';
import 'package:tfg_frontend/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      initialBinding: SplashScreenBinding(),
      getPages: AppPages.pages,
      home: const SplashScreenPage(),
    )
  );
}