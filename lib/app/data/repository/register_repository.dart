
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/utils/helpers/toast.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/routes/app_pages.dart';

class RegisterRepository {

final MyApi api;

RegisterRepository(this.api);

  static Future<void> register(UserModel user, BuildContext context) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().post(
        '/auth/register',
        data: user.toJson()
      );

      if (response.statusCode == 201) {
        ToastUtils.showSuccessToast(context, 'Success Register', 2);
        Get.toNamed(Routes.login);
      } else {
        ToastUtils.showErrorToast(context, 'Error Register: ${response.statusCode}', 2);
      }
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error Register: $error', 2);
    }
  }

}