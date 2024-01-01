import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';

class HomeController extends GetxController {

  final HomeRepository repository;
  HomeController(this.repository);

  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  RxBool isAdmin = RxBool(false);
}