// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/data/repository/register_repository.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:tfg_frontend/app/modules/home/widgets/users/add_user.dart';

class AddUserForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddUserController controller = Get.put(AddUserController(RegisterRepository(MyApi())));
  final HomeController controllerHome = Get.put(HomeController(HomeRepository(MyApi())));

  AddUserForm({super.key});

  String? textValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'enterText'.tr;
    }
    return null;
  }

  String? passwordValidator (String? value1, String? value2) {
    if (value1 == null || value1.isEmpty)  {
      return 'enterText'.tr;
    } else if (value1.length < 7)  {
      return 'longPass'.tr;
    } else if (value1 != value2) {
      return 'equalPass'.tr;
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'enterText'.tr; 
    } else {
      const pattern = r'\b[A-Za-z0-9._%+-]+@flightlinebcn\.com\b';
      if (!RegExp(pattern).hasMatch(value)) {
        return 'validEmail'.tr;
      }
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
              suffixIcon: const Icon(Icons.person, color: Color(0xFFCBC8C8),),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.surname,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'surname'.tr,
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
              suffixIcon: const Icon(Icons.person, color: Color(0xFFCBC8C8),),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
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
              suffixIcon: const Icon(Icons.person, color: Color(0xFFCBC8C8),),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.email,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'email'.tr,
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
              suffixIcon: const Icon(Icons.email, color: Color(0xFFCBC8C8),),
            ),
            validator: (value) => emailValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.password1,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'pass'.tr,
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
              suffixIcon: const Icon(Icons.key, color: Color(0xFFCBC8C8),)
            ),
            validator: (value) => passwordValidator(value, controller.password2.text),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.password2,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'repeatPass'.tr,
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
              suffixIcon: const Icon(Icons.key, color: Color(0xFFCBC8C8),)
            ),
            validator: (value) => passwordValidator(value, controller.password1.text),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: controller.role,
            items: <String>['admin', 'user'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.tr, style: textDarkGrayTextStyle),
              );
            }).toList(),
            onChanged: (String? newValue) {
              controller.role = newValue;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'rol'.tr,
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
            ),
            icon: const Icon(Icons.arrow_drop_down, color: darkGray),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            style: buttonGrayStyle,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                SharedPreferences prefs = await SharedPreferences.getInstance(); 
                UserModel user = UserModel(
                  name: controller.name.text, 
                  surname: controller.surname.text, 
                  username: controller.username.text, 
                  email: controller.email.text,
                  password: controller.password1.text,
                  role: controller.role,
                  language: prefs.getString('language') ?? 'es'
                );

                await RegisterRepository.register(user, context);
                List<UserModel>? users = await HomeRepository.getUsers(context);
                if (users != null) {
                  controllerHome.users.value = users;
                }
                controllerHome.seeUsers.value = true;
                controllerHome.seeAddUsers.value = false;
              }
            },
            icon: Icon(Icons.save, color: Theme.of(context).primaryColor),
            label: Text('addUser'.tr, style: textPrimaryColorTextStyle),
          ),
        ],
      )
    );
  }
}