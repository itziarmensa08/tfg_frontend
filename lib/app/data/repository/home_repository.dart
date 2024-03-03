
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/utils/helpers/toast.dart';
import 'package:tfg_frontend/app/data/model/aircraft_model.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';

class HomeRepository {

  final MyApi api;

  HomeRepository(this.api);

  // Users

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
        ToastUtils.showErrorToast(context, response.data);
      }
      
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error GetUsers: $error');
    }
    return null;
  }

  static Future<void> deleteUser(BuildContext context, String idUser) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().delete('/users/$idUser');

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast(context, 'userDeleted'.tr);
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }
      
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error DeleteUser: $error');
    }
  }

  static Future<UserModel?> getUserById(BuildContext context, String userId) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().get('/users/$userId');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        UserModel user = UserModel.fromJson(data);
        return user;
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }
      
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error GetUser: $error');
    }
    return null;
  }

  static Future<bool?> updateUser(BuildContext context, String userId, UserModel user) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().put(
        '/users/$userId',
        data: user.toJson()
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }
      
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error UpdateAircraft: $error');
    }
    return null;
  }

  // Aircrafts

  static Future<List<AircraftModel>?> getAircrafts(BuildContext context) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().get('/aircrafts');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        
        List<AircraftModel> aircrafts = [];
        for (var aircraft in data) {
          aircrafts.add(AircraftModel.fromJson(aircraft));
        }

        return aircrafts;

      } else {
        ToastUtils.showErrorToast(context, response.data);
      }
      
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error GetAircrafts: $error');
    }
    return null;
  }

  static Future<void> addAircraft(AircraftModel aircraft, BuildContext context) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().post(
        '/aircrafts',
        data: aircraft.toJson()
      );

      if (response.statusCode == 201) {
        ToastUtils.showSuccessToast(context, 'succesAddAircraft'.tr);
      } else {
        ToastUtils.showErrorToast(context, '${response.data}'.tr);
      }
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error AddAircraft: $error');
    }
  }

  static Future<void> deleteAircraft(BuildContext context, String idAircraft) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().delete('/aircrafts/$idAircraft');

      if (response.statusCode == 200) {
        ToastUtils.showSuccessToast(context, 'aircraftDeleted'.tr);
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }
      
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error DeleteAircraft: $error');
    }
  }

  static Future<AircraftModel?> getAircraftById(BuildContext context, String idAircraft) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().get('/aircrafts/$idAircraft');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        AircraftModel aircraft = AircraftModel.fromJson(data);
        return aircraft;
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }
      
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error GetAircraft: $error');
    }
    return null;
  }

  static Future<bool?> updateAircraft(BuildContext context, String idAircraft, AircraftModel aircraft) async {
    ApiResponse response;
    ToastUtils.initFToast(context);

    try {
      response = await MyApi().put(
        '/aircrafts/$idAircraft',
        data: aircraft.toJson()
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        ToastUtils.showErrorToast(context, response.data);
      }
      
    } catch (error) {
      ToastUtils.showErrorToast(context, 'Error UpdateAircraft: $error');
    }
    return null;
  }

}