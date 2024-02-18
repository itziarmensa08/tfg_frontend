import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/edit_user_repository.dart';
import 'package:tfg_frontend/app/modules/edit-user/edit_user_controller.dart';

class EditUserBinding implements Bindings {
  @override
  Future<void> dependencies() async {

    BuildContext context = Get.context!;
    
    Get.lazyPut<EditUserController>(() => EditUserController(EditUserRepository(MyApi())));

    final EditUserController controller = Get.put(EditUserController(EditUserRepository(MyApi())));

    String? userId = Get.parameters["userId"];

    if (userId != null) {
      UserModel? user = await EditUserRepository.getUserById(context, userId);

      if (user != null) {
        controller.user.value = user;
        controller.name.text = user.name!;
        controller.surname.text = user.surname!;
        controller.username.text = user.username!;
        controller.email.text = user.email!;

        if (user.telephone != null) {
          controller.telephone.text = user.telephone.toString();
        }

        if (user.dateBorn != null) {
          controller.dateborn.text = user.dateBorn.toString();
        }
      }
    }

    
  }
}