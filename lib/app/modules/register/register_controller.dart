import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/repository/register_repository.dart';

class RegisterController extends GetxController {

  final RegisterRepository repository;

  RegisterController(this.repository);
  
  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password1 = TextEditingController();
  final TextEditingController password2 = TextEditingController();

}