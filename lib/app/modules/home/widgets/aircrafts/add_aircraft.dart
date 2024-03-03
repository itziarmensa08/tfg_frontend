import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/widgets/aircrafts/add_aircraft_form.dart';

class AddAircraftController extends GetxController {

  final HomeRepository repository;

  AddAircraftController(this.repository);
  
  final TextEditingController name = TextEditingController();
  final TextEditingController metro = TextEditingController();

}

class AddAircraft extends StatelessWidget {
  const AddAircraft({super.key});


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
            AddAircraftForm(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}