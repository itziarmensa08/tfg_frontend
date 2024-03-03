// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/core/utils/helpers/alert.dart';
import 'package:tfg_frontend/app/core/utils/helpers/toast.dart';
import 'package:tfg_frontend/app/data/model/aircraft_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/aircrafts/edit_aircraft.dart';

class EditAircraftForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditAircraftController controller = Get.put(EditAircraftController(HomeRepository(MyApi())));
  final HomeController controllerHome = Get.put(HomeController(HomeRepository(MyApi())));

  EditAircraftForm({super.key});

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: buttonGrayStyle,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    controller.aircraft.value.name = controller.name.text;
                    controller.aircraft.value.metro = controller.metro.text;

                    bool? success = await HomeRepository.updateAircraft(
                      context, 
                      controller.aircraft.value.id!, 
                      controller.aircraft.value
                    );

                    if (success != null || success == true) {
                      List<AircraftModel>? aircrafts = await HomeRepository.getAircrafts(context);
                      if (aircrafts != null) {
                        controllerHome.aircrafts.value = aircrafts;
                      }
                      controllerHome.seeAircrafts.value = true;
                      controllerHome.seeEditAircraft.value = false;
                      ToastUtils.showSuccessToast(context, 'editAircraftSuccess'.tr);
                    }
                  }
                },
                icon: const Icon(Icons.save, color: orange),
                label: Text('editAircraft'.tr, style: textOrangeTextStyle),
              ),
              const SizedBox(width: 40),
              ElevatedButton.icon(
                style: buttonGrayStyle,
                onPressed: () async {
                  showAlert(
                    context, 
                    'deleteAircraft'.tr, 
                    'confirmDeleteAircraft'.tr, 
                    'yes'.tr, 
                    'no'.tr,
                    const Color.fromRGBO(255, 0, 0, 0.5),
                    () async {
                      await HomeRepository.deleteAircraft(context, controller.aircraft.value.id!);
                      List<AircraftModel>? aircrafts = await HomeRepository.getAircrafts(context);
                      if (aircrafts != null) {
                        controllerHome.aircrafts.value = aircrafts;
                      }
                      controllerHome.seeAircrafts.value = true;
                      controllerHome.seeEditAircraft.value = false;
                      Navigator.of(context).pop();
                    },
                    () {
                      Navigator.of(context).pop();
                    }
                  );
                },
                icon: const Icon(Icons.delete, color: Colors.red),
                label: Text('deleteAircraft'.tr, style: textPrimaryColorTextStyle.copyWith(color: Colors.red)),
              ),
            ],
          ),
        ],
      )
    );
  }
}