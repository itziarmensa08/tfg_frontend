import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/repository/login_repository.dart';

class LoginController extends GetxController {

  final LoginRepository repository;

  LoginController(this.repository);
  
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

}