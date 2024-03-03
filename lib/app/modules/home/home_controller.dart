import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/model/aircraft_model.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';

class HomeController extends GetxController {

  final HomeRepository repository;
  HomeController(this.repository);

  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  RxBool isAdmin = RxBool(false);

  RxBool seeAdmin = RxBool(true);
  RxBool seeUsers = RxBool(false);
  RxBool editUser = RxBool(false);
  RxBool seeAddUsers = RxBool(false);
  RxBool seeAircrafts = RxBool(false);
  RxBool seeAddAircraft = RxBool(false);
  RxBool seeEditAircraft = RxBool(false);
  RxBool seeAirports = RxBool(false);

  RxList<UserModel> users = <UserModel>[].obs;
  RxList<AircraftModel> aircrafts = <AircraftModel>[].obs;

}