import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';

class AircraftsList extends StatelessWidget {

  const AircraftsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Text(
          'aircraftsList'.tr,
          style: title1TextStyle,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Aircraft ${index + 1}'),
                subtitle: Text('Details of Aircraft ${index + 1}'),
              ),
            );
          },
        ),
      ],
    );
  }
}