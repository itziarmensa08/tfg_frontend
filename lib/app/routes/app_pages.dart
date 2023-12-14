import 'package:get/get.dart';
import 'package:tfg_frontend/app/modules/login/login_binding.dart';
import 'package:tfg_frontend/app/modules/login/login_page.dart';
import 'package:tfg_frontend/app/modules/splash_screen/splash_screen_page.dart';
part './routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.initial, page:() => const SplashScreenPage(),),
    GetPage(name: Routes.login, page:() => LoginPage(), binding: LoginBinding() ),
  ];
}