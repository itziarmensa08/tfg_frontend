import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/repository/login_repository.dart';

class LoginController extends GetxController {

final LoginRepository repository;
LoginController(this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}