// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/model/aircraft_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/aircrafts/add_aircraft.dart';

class AddAircraftForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddAircraftController controller = Get.put(AddAircraftController(HomeRepository(MyApi())));
  final HomeController controllerHome = Get.put(HomeController(HomeRepository(MyApi())));

  AddAircraftForm({super.key});

  String? textValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'enterText'.tr;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.name,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'name'.tr,
              labelStyle: textDarkGrayTextStyle,
              floatingLabelStyle: textOrangeTextStyle,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: darkGray,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: darkGray,
                ),
              ),
              suffixIcon: const Icon(Icons.airplanemode_active, color: Color(0xFFCBC8C8),),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.metro,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'Metro',
              labelStyle: textDarkGrayTextStyle,
              floatingLabelStyle: textOrangeTextStyle,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: darkGray,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: darkGray,
                ),
              ),
              suffixIcon: const Icon(Icons.airplanemode_active, color: Color(0xFFCBC8C8),),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            style: buttonGrayStyle,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                AircraftModel aircraft = AircraftModel(
                  name: controller.name.text,
                  metro: controller.metro.text
                );

                await HomeRepository.addAircraft(aircraft, context);
                controller.name.clear();
                controller.metro.clear();
                List<AircraftModel>? aircrafts = await HomeRepository.getAircrafts(context);
                if (aircrafts != null) {
                  controllerHome.aircrafts.value = aircrafts;
                }
                controllerHome.seeAircrafts.value = true;
                controllerHome.seeAddAircraft.value = false;
              }
            },
            icon: const Icon(Icons.save, color: orange),
            label: Text('addAircraft'.tr, style: textOrangeTextStyle),
          ),
        ],
      )
    );
  }
}