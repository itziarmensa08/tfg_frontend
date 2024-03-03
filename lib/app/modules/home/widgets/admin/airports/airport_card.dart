// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/model/airport_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/airports/edit_airport.dart';

class AirportCard extends StatefulWidget {
  final String id;
  final String name;
  final double elevation;
  final String prefixElevation;
  final String oaciCode;
  final String prefixOaciCode;
  final String iataCode;
  final String prefixIataCode;
  final IconData icon;

  const AirportCard({
    required this.id,
    required this.name,
    required this.elevation,
    required this.prefixElevation,
    required this.oaciCode,
    required this.prefixOaciCode,
    required this.iataCode,
    required this.prefixIataCode,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AirportCardState createState() => _AirportCardState();
}

class _AirportCardState extends State<AirportCard> {
  bool _isHovered = false;
  final HomeController controllerHome = Get.put(HomeController(HomeRepository(MyApi())));
  final EditAirportController controllerEdit = Get.put(EditAirportController(HomeRepository(MyApi())));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        AirportModel? airport = await HomeRepository.getAirportById(context, widget.id);
        if(airport != null) {
          controllerEdit.airport.value = airport;
          controllerEdit.name.text = airport.name!;
          controllerEdit.elevation.text = airport.elevation!.toString();
          controllerEdit.oaciCode.text = airport.oaciCode!;
          controllerEdit.iataCode.text = airport.iataCode!;
        }      
        controllerHome.seeAirports.value = false;
        controllerHome.seeEditAirports.value = true;
      },
      child: Card(
        color: white,
        elevation: 5, 
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: _isHovered ? darkGray : Colors.transparent,
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
                  color: darkGray,
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
                                widget.prefixElevation,
                                style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                              ),
                              Text(
                                widget.elevation.toString(),
                                style: textBlackTextStyle
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.prefixOaciCode,
                                style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                              ),
                              Text(
                                widget.oaciCode,
                                style: textBlackTextStyle
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.prefixIataCode,
                                style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                              ),
                              Text(
                                widget.iataCode,
                                style: textBlackTextStyle
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: _isHovered ? darkGray : white,
                          ), 
                        ],
                      ),
                      const SizedBox(height: 10),  
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