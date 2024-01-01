import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/login_repository.dart';
import 'package:tfg_frontend/app/modules/login/login_controller.dart';

class LoginBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(LoginRepository(MyApi())));
  }
  
}