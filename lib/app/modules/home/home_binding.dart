import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  Future<void> dependencies() async {

    BuildContext context = Get.context!;

    Get.lazyPut<HomeController>(() => HomeController(HomeRepository(MyApi())));

    final HomeController controller = Get.put(HomeController(HomeRepository(MyApi())));

    controller.sideMenu.addListener((index) {
      controller.pageController.jumpToPage(index);
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isAdmin = prefs.getBool('isAdmin');

    if (isAdmin != null) {
      controller.isAdmin.value = isAdmin;
    }

    // ignore: use_build_context_synchronously
    List<UserModel>? users = await HomeRepository.getUsers(context);

    if (users != null) {
      controller.users.value = users;
    }

  }

  
}