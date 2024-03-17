// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/core/utils/helpers/alert.dart';
import 'package:tfg_frontend/app/core/utils/helpers/toast.dart';
import 'package:tfg_frontend/app/data/model/airport_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/airports/edit_airport.dart';

class EditAirportForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditAirportController controller = Get.put(EditAirportController(HomeRepository(MyApi())));
  final HomeController controllerHome = Get.put(HomeController(HomeRepository(MyApi())));

  EditAirportForm({super.key});

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
            controller: controller.elevation,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'elevation'.tr,
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
              suffixIcon: const Icon(Icons.numbers, color: Color(0xFFCBC8C8),),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.oaciCode,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'oaciCode'.tr,
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
              suffixIcon: const Icon(Icons.code, color: Color(0xFFCBC8C8),),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.iataCode,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'iataCode'.tr,
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
              suffixIcon: const Icon(Icons.code, color: Color(0xFFCBC8C8),),
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
                    controller.airport.value.name = controller.name.text;
                    controller.airport.value.elevation = double.parse(controller.elevation.text);
                    controller.airport.value.oaciCode = controller.oaciCode.text;
                    controller.airport.value.iataCode = controller.iataCode.text;

                    bool? success = await HomeRepository.updateAirport(
                      context, 
                      controller.airport.value.id!, 
                      controller.airport.value
                    );

                    if (success != null || success == true) {
                      List<AirportModel>? airports = await HomeRepository.getAirports(context);
                      if (airports != null) {
                        controllerHome.airports.value = airports;
                      }
                      controllerHome.seeAirports.value = true;
                      controllerHome.seeEditAirports.value = false;
                      ToastUtils.showSuccessToast(context, 'editAirportSuccess'.tr);
                    }
                  }
                },
                icon: const Icon(Icons.save, color: darkGray),
                label: Text('editAirport'.tr, style: textDarkGrayTextStyle),
              ),
              const SizedBox(width: 40),
              ElevatedButton.icon(
                style: buttonGrayStyle,
                onPressed: () async {
                  showAlert(
                    context, 
                    'deleteAirport'.tr, 
                    'confirmDeleteAirport'.tr, 
                    'yes'.tr, 
                    'no'.tr,
                    const Color.fromRGBO(255, 0, 0, 0.5),
                    () async {
                      await HomeRepository.deleteAirport(context, controller.airport.value.id!);
                      List<AirportModel>? airports = await HomeRepository.getAirports(context);
                      if (airports != null) {
                        controllerHome.airports.value = airports;
                      }
                      controllerHome.seeAirports.value = true;
                      controllerHome.seeEditAirports.value = false;
                      Navigator.of(context).pop();
                    },
                    () {
                      Navigator.of(context).pop();
                    }
                  );
                },
                icon: const Icon(Icons.delete, color: Colors.red),
                label: Text('deleteAirport'.tr, style: textPrimaryColorTextStyle.copyWith(color: Colors.red)),
              ),
            ],
          ),
        ],
      )
    );
  }
}