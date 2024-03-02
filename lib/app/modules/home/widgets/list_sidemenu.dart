import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<SideMenuItem> buildSideMenuItems(controller) {
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
      onTap: (index, _) {
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
          controller.seeUsers.value = false;
          controller.editUser.value = false;
          controller.seeAirports.value = false;
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
