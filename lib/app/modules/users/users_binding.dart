import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/users_repository.dart';
import 'package:tfg_frontend/app/modules/users/users_controller.dart';

class UsersBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<UsersController>(() => UsersController(
     UsersRepository(MyApi())));
  }
}