// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/core/utils/helpers/alert.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:tfg_frontend/app/routes/app_pages.dart';

class UserCard extends StatefulWidget {
  final String id;
  final String name;
  final String prefixUsername;
  final String username;
  final String prefixEmail;
  final String email;
  final String prefixRole;
  final String role;
  final String prefixTelephone;
  final String telephone;
  final String prefixBorn;
  final String dateBorn;
  final IconData icon;

  UserCard({
    required this.id,
    required this.name,
    required this.prefixUsername,
    required this.username,
    required this.prefixEmail,
    required this.email,
    required this.prefixRole,
    required this.role,
    required this.prefixTelephone,
    required this.telephone,
    required this.prefixBorn,
    required this.dateBorn,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final HomeController controllerHome = Get.put(HomeController(HomeRepository(MyApi())));

  @override
  // ignore: library_private_types_in_public_api
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: darkGray,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              size: 50,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    widget.name,
                    style: titleWhiteTextStyle.copyWith(fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.prefixUsername,
                                style: textWhiteTextStyle.copyWith(fontWeight: FontWeight.bold)
                              ),
                              Text(
                                widget.username,
                                style: textWhiteTextStyle
                              ),
                            ],
                          ),                          
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                widget.prefixEmail,
                                style: textWhiteTextStyle.copyWith(fontWeight: FontWeight.bold)
                              ),
                              Text(
                                widget.email,
                                style: textWhiteTextStyle
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.prefixRole,
                                style: textWhiteTextStyle.copyWith(fontWeight: FontWeight.bold)
                              ),
                              Text(
                                widget.role,
                                style: textWhiteTextStyle
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                widget.prefixTelephone,
                                style: textWhiteTextStyle.copyWith(fontWeight: FontWeight.bold)
                              ),
                              Text(
                                widget.telephone,
                                style: textWhiteTextStyle
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.prefixBorn,
                                style: textWhiteTextStyle.copyWith(fontWeight: FontWeight.bold)
                              ),
                              Text(
                                widget.dateBorn,
                                style: textWhiteTextStyle
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            '',
                            style: textWhiteTextStyle
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () => {
                              Get.toNamed(
                                Routes.editUser, 
                                parameters: {
                                  "userId": widget.id
                                }
                              )
                            }, 
                            icon: const Icon(Icons.edit),
                            hoverColor: gray,
                          ),
                          const SizedBox(height: 10),
                          IconButton(
                            onPressed: () => {
                              showAlert(
                                context, 
                                'deleteUser'.tr, 
                                'confirmDeleteUser'.tr, 
                                'yes'.tr, 
                                'no'.tr,
                                const Color.fromRGBO(255, 0, 0, 0.5),
                                () async {
                                  await HomeRepository.deleteUser(context, widget.id);
                                  List<UserModel>? users = await HomeRepository.getUsers(context);
                                  if (users != null) {
                                    widget.controllerHome.users.value = users;
                                  }
                                  Navigator.of(context).pop();
                                },
                                () {
                                  Navigator.of(context).pop();
                                }
                              )
                            }, 
                            icon: const Icon(Icons.delete),
                            hoverColor: gray,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )  
          ],
        ),
      )
    );
  }
}