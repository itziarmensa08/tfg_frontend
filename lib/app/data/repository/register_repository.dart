
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/utils/helpers/toast.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';

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
        ToastUtils.showSuccessToast(context, 'successRegister'.tr);
      } else {
        ToastUtils.showErrorToast(context, '${response.data}'.tr);
      }
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error Register: $error');
    }
  }

}