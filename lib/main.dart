import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg_frontend/app/core/theme/app_theme.dart';
import 'package:tfg_frontend/app/modules/splash_screen/splash_screen_binding.dart';
import 'package:tfg_frontend/app/modules/splash_screen/splash_screen_page.dart';
import 'package:tfg_frontend/app/routes/app_pages.dart';
import 'package:tfg_frontend/app/translations/app_translations.dart';

Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      theme: appThemeData,
      defaultTransition: Transition.noTransition,
      initialBinding: SplashScreenBinding(),
      getPages: AppPages.pages,
      home: const SplashScreenPage(),
      translationsKeys: AppTranslation.translations,
      locale: Locale(prefs.getString('language') ?? 'es'),
    )
  );
}