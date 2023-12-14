import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/repository/splash_screen_repository.dart';
import 'package:tfg_frontend/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {

  final SplashScreenRepository repository;

  SplashScreenController(this.repository);

  var isUserLoggedIn = false.obs;

  Future<void> checkUser() async {
    isUserLoggedIn.value = await repository.getUser();
    
    if (isUserLoggedIn.value == true) {
      Get.toNamed(Routes.listProcedures);
    } else {
      Get.toNamed(Routes.login);
    }
  }

}