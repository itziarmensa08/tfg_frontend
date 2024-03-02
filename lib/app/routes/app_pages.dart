import 'package:get/get.dart';
import 'package:tfg_frontend/app/modules/home/home_binding.dart';
import 'package:tfg_frontend/app/modules/home/home_page.dart';
import 'package:tfg_frontend/app/modules/login/login_binding.dart';
import 'package:tfg_frontend/app/modules/login/login_page.dart';
import 'package:tfg_frontend/app/modules/register/register_binding.dart';
import 'package:tfg_frontend/app/modules/register/register_page.dart';
import 'package:tfg_frontend/app/modules/splash_screen/splash_screen_binding.dart';
import 'package:tfg_frontend/app/modules/splash_screen/splash_screen_page.dart';
part './routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(
      name: Routes.initial, 
      page:() => const SplashScreenPage(), 
      binding: SplashScreenBinding()
    ),
    GetPage(
      name: Routes.login, 
      page:() => const LoginPage(), 
      binding: LoginBinding() 
    ),
    GetPage(
      name: Routes.register,
      page:()=> const RegisterPage(), 
      binding: RegisterBinding() 
    ),
    GetPage(
      name: Routes.home, 
      page: ()=> const HomePage(), 
      binding: HomeBinding() 
    ),
  ];
}