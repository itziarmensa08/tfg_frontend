import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Text(
              'dashboard'.tr,
              style: title1TextStyle,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Wrap(
              spacing: MediaQuery.of(context).size.height * 0.1,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                DashboardCard(
                  title: 'users'.tr,
                  icon: Icons.people,
                  onTap: () {
                    controllerHome.seeAdmin.value = false;
                    controllerHome.seeUsers.value = true;
                  },
                ),
                DashboardCard(
                  title: 'aircrafts'.tr,
                  icon: Icons.airplanemode_active,
                  onTap: () {
                    controllerHome.seeAdmin.value = false;
                    controllerHome.seeAircrafts.value = true;
                  },
                ),
                DashboardCard(
                  title: 'airports'.tr,
                  icon: Icons.location_city,
                  onTap: () {
                    controllerHome.seeAdmin.value = false;
                    controllerHome.seeAirports.value = true;
                  },
                ),
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
  final IconData icon;
  final VoidCallback onTap;

  const DashboardCard({
    required this.title,
    required this.icon,
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
          elevation: _isHovered ? 5 : 3,
          color: _isHovered ? gray : darkGray,
          child: SizedBox(
            width: MediaQuery.of(context).size.height * 0.4,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.title,
                    style: textWhiteTextStyle
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