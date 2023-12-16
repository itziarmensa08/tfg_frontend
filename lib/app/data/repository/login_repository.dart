
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tfg_frontend/app/core/utils/helpers/toast.dart';
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
        ToastUtils.showSuccessToast(context, 'Success Login', 2);
      } else {
        ToastUtils.showErrorToast(context, 'Error Login', 2);
      }
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error Login: $error', 2);
    }
  }

}