import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/register_repository.dart';
import 'package:tfg_frontend/app/modules/register/register_controller.dart';

class RegisterBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<RegisterController>(() => RegisterController(
     RegisterRepository(MyApi())));
  }
}