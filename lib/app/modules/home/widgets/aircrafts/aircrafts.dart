import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/model/aircraft_model.dart';
import 'package:tfg_frontend/app/modules/home/widgets/aircrafts/aircraft_card.dart';

class AircraftsList extends StatelessWidget {

  final RxList<AircraftModel> aircrafts;

  const AircraftsList({
    Key? key,
    required this.aircrafts
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Text(
            'aircraftsList'.tr,
            style: title1TextStyle,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Obx(() =>ListView.builder(
            shrinkWrap: true,
            itemCount: aircrafts.length, 
            itemBuilder: (context, index) {
              return AircraftCard(
                id: aircrafts[index].id!,
                name: aircrafts[index].name!,
                metro: aircrafts[index].metro!,
                icon: Icons.airplanemode_active,
              );
            },
          )),
        ],
      ),
    );
  }
}