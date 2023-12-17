
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg_frontend/app/core/utils/helpers/toast.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';

class LoginRepository {

final MyApi api;

LoginRepository(this.api);

  static Future<void> login(String? username, String? password, BuildContext context) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().post(
        '/auth/login',
        data: {
          "username": username, 
          "password": password
        },
      );

      if (response.statusCode == 200) {
        dynamic data = response.data;
        UserModel userModel = UserModel.fromJson(data['user']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['token']);
        prefs.setString('id', userModel.id!);

      } else {
        ToastUtils.showErrorToast(context, '${response.data}'.tr);
      }
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error Login: $error');
    }
  }

}