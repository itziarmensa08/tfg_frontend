import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/admin_dashboard.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/aircrafts/add_aircraft.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/aircrafts/aircrafts.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/aircrafts/edit_aircraft.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/airports/add_airport.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/airports/airports.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/airports/edit_airport.dart';
import 'package:tfg_frontend/app/modules/home/widgets/list_sidemenu.dart';
import 'package:tfg_frontend/app/modules/home/widgets/principal_page.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/users/add_user.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/users/edit_user.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/users/users.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {    

    return Scaffold(      
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() => SideMenu(
            controller: controller.sideMenu,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: gray,
              selectedHoverColor: orange,
              selectedColor: orange,
              selectedTitleTextStyle: textWhiteTextStyle,
              unselectedTitleTextStyle: textBlackTextStyle,
              selectedIconColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              itemBorderRadius: const BorderRadius.all(Radius.circular(30.0)),
              itemOuterPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
            ),
            title: Column(
              children: [
                Image.asset('assets/aircraft.png'),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
              ],
            ),
            items: buildSideMenuItems(controller)
          )),
          Expanded(
            child: PageView(
              controller: controller.pageController,
              children: [
                Container(
                  color: Theme.of(context).colorScheme.background,
                  child: const PrincipalPage()
                ),
                Container(
                  color: Theme.of(context).colorScheme.background,
                  child: const Center(
                    child: Text(
                      'Nuevo análisis',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Theme.of(context).colorScheme.background,
                  child: const Center(
                    child: Text(
                      'Tareas',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Theme.of(context).colorScheme.background,
                  child: const Center(
                    child: Text(
                      'Perfil',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(),
                Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Obx(() {
                    if (controller.seeAdmin.value) {
                      return AdminDashboard();
                    } else if (controller.seeUsers.value) {
                      return UserList(users: controller.users);
                    } else if (controller.editUser.value) {
                      return const EditUser();
                    } else if (controller.seeAddUsers.value) {
                      return const AddUser();
                    } else if (controller.seeAircrafts.value) {
                      return AircraftsList(aircrafts: controller.aircrafts);
                    } else if (controller.seeAddAircraft.value) {
                      return const AddAircraft();
                    } else if (controller.seeEditAircraft.value) {
                      return const EditAircraft();
                    } else if (controller.seeAirports.value) {
                      return AirportsList(airports: controller.airports);
                    } else if (controller.seeAddAirports.value) {
                      return const AddAirport();
                    } else if (controller.seeEditAirports.value) {
                      return const EditAirport();
                    } else {
                      return const Text('Cargando ...');
                    }
                  })
                ),
                Container(
                  color: Theme.of(context).colorScheme.background,
                  child: const Center(
                    child: Text(
                      'Configuración',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}