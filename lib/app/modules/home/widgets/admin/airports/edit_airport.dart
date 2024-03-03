import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/data/model/airport_model.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/airports/edit_airport_form.dart';

class EditAirportController extends GetxController {

  final HomeRepository repository;

  EditAirportController(this.repository);
  
  final TextEditingController name = TextEditingController();
  final TextEditingController elevation = TextEditingController();
  final TextEditingController oaciCode = TextEditingController();
  final TextEditingController iataCode = TextEditingController();

  final Rx<AirportModel> airport = AirportModel().obs;

}

class EditAirport extends StatelessWidget {
  const EditAirport({super.key});


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
            EditAirportForm(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}