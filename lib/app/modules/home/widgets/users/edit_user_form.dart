// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/core/utils/helpers/alert.dart';
import 'package:tfg_frontend/app/core/utils/helpers/toast.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:tfg_frontend/app/modules/home/widgets/users/edit_user.dart';

class EditUserForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditUserController controller = Get.put(EditUserController(HomeRepository(MyApi())));
  final HomeController controllerHome = Get.put(HomeController(HomeRepository(MyApi())));

  EditUserForm({super.key});

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

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
    } else {
      final phoneRegex = RegExp(r'^[0-9]{9}$');
      if (!phoneRegex.hasMatch(value)) {
        return 'invalidPhone'.tr; 
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
            controller: controller.telephone,
            cursorColor: Theme.of(context).hintColor,
            style: textDarkGrayTextStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'telephone'.tr,
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
              suffixIcon: const Icon(Icons.phone, color: Color(0xFFCBC8C8),),
            ),
            validator: (value) => phoneValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.dateborn,
            readOnly: true,
            style: textDarkGrayTextStyle,
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: darkGray, 
                        onPrimary: Colors.white, 
                        surface: Colors.white, 
                      ),
                      dialogBackgroundColor:Colors.white,
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: darkGray,
                        ),
                      ),
                      textTheme: const TextTheme(
                        titleMedium: TextStyle(color: darkGray),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (pickedDate != null) {
                controller.date = pickedDate;
                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                controller.dateborn.text = formattedDate;
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
              labelText: 'dateBorn'.tr,
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
              suffixIcon: const Icon(Icons.date_range, color: Color(0xFFCBC8C8)),
            ),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: buttonGrayStyle,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    controller.user.value.name = controller.name.text;
                    controller.user.value.surname = controller.surname.text;
                    controller.user.value.username = controller.username.text;
                    controller.user.value.email = controller.email.text;
                    if (controller.telephone.text.isNotEmpty) {
                      controller.user.value.telephone = int.tryParse(controller.telephone.text);
                    }
                    if (controller.date != null) {
                      controller.user.value.dateBorn = controller.date;
                    }
                    if (controller.role != null) {
                      controller.user.value.role = controller.role;
                    }

                    bool? success = await HomeRepository.updateUser(context, controller.user.value.id!, controller.user.value);

                    if (success != null || success == true) {
                      List<UserModel>? users = await HomeRepository.getUsers(context);
                      if (users != null) {
                        controllerHome.users.value = users;
                        controllerHome.seeUsers.value = true;
                        controllerHome.editUser.value = false;
                      }
                      ToastUtils.showSuccessToast(context, 'editUserSuccess'.tr);
                    }
                  }
                },
                icon: Icon(Icons.save, color: Theme.of(context).primaryColor),
                label: Text('editUser'.tr, style: textPrimaryColorTextStyle),
              ),
              const SizedBox(width: 40),
              ElevatedButton.icon(
                style: buttonGrayStyle,
                onPressed: () async {
                  showAlert(
                    context, 
                    'deleteUser'.tr, 
                    'confirmDeleteUser'.tr, 
                    'yes'.tr, 
                    'no'.tr,
                    const Color.fromRGBO(255, 0, 0, 0.5),
                    () async {
                      await HomeRepository.deleteUser(context, controller.user.value.id!);
                      List<UserModel>? users = await HomeRepository.getUsers(context);
                      if (users != null) {
                        controllerHome.users.value = users;
                        controllerHome.seeUsers.value = true;
                        controllerHome.editUser.value = false;
                      }
                      Navigator.of(context).pop();
                    },
                    () {
                      Navigator.of(context).pop();
                    }
                  );
                },
                icon: const Icon(Icons.delete, color: Colors.red),
                label: Text('deleteUser'.tr, style: textPrimaryColorTextStyle.copyWith(color: Colors.red)),
              ),
            ],
          ),
        ],
      )
    );
  }
}