import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/airports/add_airport_form.dart';

class AddAirportController extends GetxController {

  final HomeRepository repository;

  AddAirportController(this.repository);
  
  final TextEditingController name = TextEditingController();
  final TextEditingController elevation = TextEditingController();
  final TextEditingController oaciCode = TextEditingController();
  final TextEditingController iataCode = TextEditingController();

}

class AddAirport extends StatelessWidget {
  const AddAirport({super.key});


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
              backgroundColor: darkGray,
              child: Icon(Icons.connecting_airports, size: 70.0, color: Colors.white,),
            ),
            const SizedBox(height: 40),
            AddAirportForm(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}