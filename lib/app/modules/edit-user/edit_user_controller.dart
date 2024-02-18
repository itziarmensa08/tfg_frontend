import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/repository/edit_user_repository.dart';

class EditUserController extends GetxController {

  final EditUserRepository repository;
  EditUserController(this.repository);

  Rx<UserModel> user = UserModel().obs;

  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController telephone = TextEditingController();
  final TextEditingController dateborn = TextEditingController();

  DateTime? date;
  String? role;

}