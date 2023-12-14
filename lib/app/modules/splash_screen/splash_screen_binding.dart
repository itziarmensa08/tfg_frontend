import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/repository/splash_screen_repository.dart';
import 'package:tfg_frontend/app/modules/splash_screen/splash_screen_controller.dart';

class SplashScreenBinding implements Bindings {
@override
void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(
      SplashScreenRepository()));
  }
}