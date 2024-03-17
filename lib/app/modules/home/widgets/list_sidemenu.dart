
// ignore_for_file: use_build_context_synchronously

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/users/edit_user.dart';
import 'package:tfg_frontend/app/modules/home/widgets/new_analysis/new_analysis.dart';

List<SideMenuItem> buildSideMenuItems(controller) {

  BuildContext context = Get.context!;
  final EditUserController controllerEdit = Get.put(EditUserController(HomeRepository(MyApi())));
  final NewAnalysisController controllerNew = Get.put(NewAnalysisController());

  List<SideMenuItem> items = [
    SideMenuItem(
      title: 'home'.tr,
      onTap: (index, _) {
        controller.sideMenu.changePage(index);
      },
      icon: const Icon(Icons.home),
    ),
    SideMenuItem(
      title: 'newAnalisis'.tr,
      onTap: (index, _) {
        controllerNew.addAirport.value = false;
        controllerNew.selectedAirport.value = null;
        controller.sideMenu.changePage(index);
      },
      icon: const Icon(Icons.library_add),
    ),
    SideMenuItem(
      title: 'tasks'.tr,
      onTap: (index, _) {
        controller.sideMenu.changePage(index);
      },
      icon: const Icon(Icons.task),
    ),
    SideMenuItem(
      title: 'profile'.tr,
      onTap: (index, _) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();  
        var idUser = prefs.getString('id');
        if (idUser != null) {
          var user = await HomeRepository.getUserById(context, idUser);
          if (user != null) {
            controllerEdit.user.value = user;
            controllerEdit.name.text = user.name!;
            controllerEdit.surname.text = user.surname!;
            controllerEdit.username.text = user.username!;
            controllerEdit.email.text = user.email!;
            controllerEdit.role = user.role!;

            if (user.telephone != null) {
              controllerEdit.telephone.text = user.telephone.toString();
            } else {
              controllerEdit.telephone = TextEditingController();
            }

            if (user.dateBorn != null) {
              controllerEdit.dateborn.text = user.dateBorn.toString();
            } else {
              controllerEdit.dateborn = TextEditingController();
            }
          }
        }
        controller.sideMenu.changePage(index);
      },
      icon: const Icon(Icons.person),
    ),
    SideMenuItem(
      builder: (context, displayMode) {
        return const Divider();
      },
    ),
  ];

  if (controller.isAdmin.value) {
    items.add(
      SideMenuItem(
        title: 'admin'.tr,
        onTap: (index, _) {
          controller.seeAdmin.value = true;
          controller.seeAircrafts.value = false;
          controller.seeAddAircraft.value = false;
          controller.seeEditAircraft.value = false;
          controller.seeUsers.value = false;
          controller.seeAddUsers.value = false;
          controller.editUser.value = false;
          controller.seeAirports.value = false;
          controller.seeAddAirports.value = false;
          controller.seeEditAirports.value = false;
          controller.sideMenu.changePage(index);
        },
        icon: const Icon(Icons.admin_panel_settings),
      ),
    );
  }

  items.add(
    SideMenuItem(
      title: 'settings'.tr,
      onTap: (index, _) {
        controller.sideMenu.changePage(index);
      },
      icon: const Icon(Icons.settings),
    ),
  );

  return items;
}
