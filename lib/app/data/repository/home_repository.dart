
import 'package:flutter/material.dart';
import 'package:tfg_frontend/app/core/utils/helpers/toast.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';

class HomeRepository {

  final MyApi api;

  HomeRepository(this.api);

  static Future<List<UserModel>?> getUsers(BuildContext context) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().get('/users');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        
        List<UserModel> users = [];
        for (var user in data) {
          users.add(UserModel.fromJson(user));
        }

        return users;

      } else {
        // ignore: use_build_context_synchronously
        ToastUtils.showErrorToast(context, response.data);
      }
      
    } catch (error) {
      // ignore: use_build_context_synchronously
      ToastUtils.showErrorToast(context, 'Error GetUsers: $error');
    }
    return null;
  }

}