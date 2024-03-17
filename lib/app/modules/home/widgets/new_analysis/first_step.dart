import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/model/airport_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:tfg_frontend/app/modules/home/widgets/new_analysis/new_analysis.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];


class FirstStep extends StatelessWidget {
  FirstStep({super.key});

  final HomeController controllerHome = Get.put(HomeController(HomeRepository(MyApi())));
  final NewAnalysisController controllerNew = Get.put(NewAnalysisController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Text('selectairport'.tr, style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(width: 20),
            Obx(() => 
              DropdownButton<AirportModel>(
                value: controllerNew.selectedAirport.value,
                elevation: 16,
                style: textBlackTextStyle,
                onChanged: (AirportModel? newValue) {
                  if (newValue != null) {
                    controllerNew.selectedAirport.value = newValue;
                  }
                },
                items: controllerHome.airports.map<DropdownMenuItem<AirportModel>>((AirportModel airport) {
                  return DropdownMenuItem<AirportModel>(
                    value: airport,
                    child: Text(airport.name ?? 'no tengo name'),
                  );
                }).toList(),
              ),
            ),            
            const SizedBox(width: 20),
            Text('addAirportStep1'.tr, style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)),
            IconButton(onPressed: () => {
              controllerNew.addAirport.value = true
            }, icon: const Icon(Icons.add_box_outlined))
          ],
        ),
      ],
    );
  }
}