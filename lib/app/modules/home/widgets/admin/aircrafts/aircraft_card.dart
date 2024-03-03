// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/model/aircraft_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/aircrafts/edit_aircraft.dart';

class AircraftCard extends StatefulWidget {
  final String id;
  final String name;
  final String metro;
  final IconData icon;

  const AircraftCard({
    required this.id,
    required this.name,
    required this.metro,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<AircraftCard> {
  bool _isHovered = false;
  final HomeController controllerHome = Get.put(HomeController(HomeRepository(MyApi())));
  final EditAircraftController controllerEdit = Get.put(EditAircraftController(HomeRepository(MyApi())));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        AircraftModel? aircraft = await HomeRepository.getAircraftById(context, widget.id);
        if(aircraft != null) {
          controllerEdit.aircraft.value = aircraft;
          controllerEdit.name.text = aircraft.name!;
          controllerEdit.metro.text = aircraft.metro!;
        }      
        controllerHome.seeAircrafts.value = false;
        controllerHome.seeEditAircraft.value = true;
      },
      child: Card(
        color: white,
        elevation: 5, 
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: _isHovered ? orange : Colors.transparent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: MouseRegion(
          onEnter: (event) => setState(() => _isHovered = true),
          onExit: (event) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  widget.icon,
                  size: 50,
                  color: orange,
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        widget.name,
                        style: titleBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Metro: ',
                                style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                              ),
                              Text(
                                widget.metro,
                                style: textBlackTextStyle
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: _isHovered ? orange : white,
                          ), 
                        ],
                      ),
                      const SizedBox(height: 20),  
                    ],
                  ),
                )  
              ],
            ),
          ),
        )
      ),
    );
  }
}