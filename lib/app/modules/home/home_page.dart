import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin_dashboard.dart';
import 'package:tfg_frontend/app/modules/home/widgets/aircrafts.dart';
import 'package:tfg_frontend/app/modules/home/widgets/airports.dart';
import 'package:tfg_frontend/app/modules/home/widgets/list_sidemenu.dart';
import 'package:tfg_frontend/app/modules/home/widgets/users.dart';

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
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 150,
                        maxWidth: 150,
                      ),
                      child: Image.asset(
                        'assets/aircraft.png',
                      ),
                    ),
                    Text(
                      'EOSIDcalculation'.tr,
                      style: titleWhiteTextStyle,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 5,
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
                  child: const Center(
                    child: Text(
                      'Página principal',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
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
                    } else if (controller.seeAircrafts.value) {
                      return const AircraftsList();
                    } else if (controller.seeAirports.value) {
                      return const AirportsList();
                    } else {
                      return const Text('Cargando ...');
                    }
                  },)
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