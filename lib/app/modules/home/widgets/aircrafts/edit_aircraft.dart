import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/data/model/aircraft_model.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/widgets/aircrafts/edit_aircraft_form.dart';

class EditAircraftController extends GetxController {

  final HomeRepository repository;

  EditAircraftController(this.repository);
  
  final TextEditingController name = TextEditingController();
  final TextEditingController metro = TextEditingController();

  final Rx<AircraftModel> aircraft = AircraftModel().obs;

}

class EditAircraft extends StatelessWidget {
  const EditAircraft({super.key});


  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundColor: orange,
              child: Icon(Icons.airplanemode_active, size: 70.0, color: Colors.white,),
            ),
            const SizedBox(height: 40),
            EditAircraftForm(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}