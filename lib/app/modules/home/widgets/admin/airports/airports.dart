import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/model/airport_model.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/airports/airport_card.dart';

class AirportsList extends StatelessWidget {

  final RxList<AirportModel> airports;

  const AirportsList({
    Key? key,
    required this.airports
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Text(
            'airportsList'.tr,
            style: title1TextStyle,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Obx(() =>ListView.builder(
            shrinkWrap: true,
            itemCount: airports.length, 
            itemBuilder: (context, index) {
              return AirportCard(
                id: airports[index].id!,
                name: airports[index].name!,
                elevation: airports[index].elevation!,
                prefixElevation: '${'elevation'.tr}: ',
                oaciCode: airports[index].oaciCode!,
                prefixOaciCode: '${'oaciCode'.tr}: ',
                iataCode: airports[index].iataCode!,
                prefixIataCode: '${'iataCode'.tr}: ',
                icon: Icons.connecting_airports,
              );
            },
          )),
        ],
      ),
    );
  }
}