// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/repository/login_repository.dart';
import 'package:tfg_frontend/app/modules/login/login_controller.dart';
import 'dart:async';

import 'package:tfg_frontend/app/routes/app_pages.dart';


class LoginForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.find<LoginController>();

  LoginForm({super.key});

  Future<String?> validatorUsername (String? value, BuildContext context) async {
    if (value == null || value.isEmpty)  {
      return 'enterText'.tr;
    } else {
      var response = await LoginRepository.login(controller.username.text, controller.password.text, context);
      if (response == 'Not found user') {
        return 'Not found user'.tr;
      }
    }    
    return null;
  }

  Future<String?> validatorPassword (String? value, BuildContext context) async {
    if (value == null || value.isEmpty)  {
      return 'enterText'.tr;
    } else {
      var response = await LoginRepository.login(controller.username.text, controller.password.text, context);
      if (response == 'Incorrect password') {
        return 'Incorrect password'.tr;
      }
    }    
    return null;
  }

  String? validateUsername;
  String? validatePassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.username,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'username'.tr,
              labelStyle: textDarkGrayTextStyle,
              floatingLabelStyle: textOrangeTextStyle,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              suffixIcon: const Icon(Icons.person, color: Color(0xFFCBC8C8),),
            ),
            onChanged: (value) async {
              validateUsername = await validatorUsername(value, context);
            },
            validator: (_) {
              if (validateUsername != null) {
                return validateUsername;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.password,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'pass'.tr,
              labelStyle: textDarkGrayTextStyle,
              floatingLabelStyle: textOrangeTextStyle,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              suffixIcon: const Icon(Icons.key, color: Color(0xFFCBC8C8),)
            ),
            onChanged: (value) async {
              validatePassword = await validatorPassword(value, context);
            },
            validator: (value) {
              if (validatePassword != null) {
                return validatePassword;
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: buttonBlueStyle,
            onPressed: () async {
              validateUsername = await validatorUsername(controller.username.text, context);
              validatePassword = await validatorPassword(controller.password.text, context);
              if (_formKey.currentState!.validate()) {
                var login = await LoginRepository.login(controller.username.text, controller.password.text, context);
                if (login == '200') {
                  Get.toNamed(Routes.home);
                }
              }              
            },
            child: Text('getIn'.tr, style: textDarkGrayTextStyle,),
          ),
        ],
      )
    );
  }
}