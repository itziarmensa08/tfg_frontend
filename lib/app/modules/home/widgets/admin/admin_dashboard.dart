import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/global_widgets/separator.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';

class AdminDashboard extends StatelessWidget {
  AdminDashboard({Key? key}) : super(key: key);
  final HomeController controllerHome = Get.put(HomeController(HomeRepository(MyApi())));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              'dashboard'.tr,
              style: title1TextStyle,
            ),
            const SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildSeparator(context, 'users'.tr, Theme.of(context).primaryColor),
                const SizedBox(height: 50),
                Wrap(
                  spacing: 30,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    DashboardCard(
                      title: 'usersTitle'.tr,
                      subtitle: 'usersSubtitle'.tr,
                      icon: Icons.people,
                      color: Theme.of(context).primaryColor,
                      onTap: () {
                        controllerHome.seeAdmin.value = false;
                        controllerHome.seeUsers.value = true;
                      },
                    ),
                    DashboardCard(
                      title: 'addUserTitle'.tr,
                      subtitle: 'addUserSubtitle'.tr,
                      icon: Icons.person_add,
                      color: Theme.of(context).primaryColor,
                      onTap: () {
                        controllerHome.seeAdmin.value = false;
                        controllerHome.seeAddUsers.value = true;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                buildSeparator(context, 'aircrafts'.tr, orange),
                const SizedBox(height: 50),
                Wrap(
                  spacing: 30,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    DashboardCard(
                      title: 'aircraftsTitle'.tr,
                      subtitle: 'aircraftsSubtitle'.tr,
                      icon: Icons.airplanemode_active,
                      color: orange,
                      onTap: () {
                        controllerHome.seeAdmin.value = false;
                        controllerHome.seeAircrafts.value = true;
                      },
                    ),
                    DashboardCard(
                      title: 'addAircraftTitle'.tr,
                      subtitle: 'addAircraftSubtitle'.tr,
                      icon: Icons.add_circle_outline_outlined,
                      color: orange,
                      onTap: () {
                        controllerHome.seeAdmin.value = false;
                        controllerHome.seeAddAircraft.value = true;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                buildSeparator(context, 'airports'.tr, darkGray),
                const SizedBox(height: 50),
                Wrap(
                  spacing: 30,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    DashboardCard(
                      title: 'airportsTitle'.tr,
                      subtitle: 'airportsSubtitle'.tr,
                      icon: Icons.connecting_airports,
                      color: darkGray,
                      onTap: () {
                        controllerHome.seeAdmin.value = false;
                        controllerHome.seeAirports.value = true;
                      },
                    ),
                    DashboardCard(
                      title: 'addAirportTitle'.tr,
                      subtitle: 'addAirportSubtitle'.tr,
                      icon: Icons.add_home_work_outlined,
                      color: darkGray,
                      onTap: () {
                        controllerHome.seeAdmin.value = false;
                        controllerHome.seeAddAirports.value = true;
                      },
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardCardState createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Card(
          elevation: 5,
          color: white,
          shape: RoundedRectangleBorder( 
            side: BorderSide(
              color: _isHovered ? widget.color : Colors.transparent,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            width: 250,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    widget.icon,
                    size: 40,
                    color: widget.color,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.title,
                    style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.subtitle,
                    style: textBlackTextStyle
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}