import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/modules/splash_screen/splash_screen_controller.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.5),
              CircularProgressIndicator(color: Theme.of(context).primaryColor),
              const Spacer(),             
              Image.asset(
                'assets/logo_flightline.png',
                width: 150,
                height: 150,
              )
            ],
          )
        )
      )
    );
  }
}