// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/provider/api.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/home_controller.dart';
import 'package:tfg_frontend/app/modules/home/widgets/users/edit_user.dart';

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
  final String prefixLang;
  final String lang;
  final IconData icon;

  const UserCard({
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
    required this.prefixLang,
    required this.lang,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool _isHovered = false;
  final HomeController controllerHome = Get.put(HomeController(HomeRepository(MyApi())));
  final EditUserController controllerEdit = Get.put(EditUserController(HomeRepository(MyApi())));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        UserModel? user = await HomeRepository.getUserById(context, widget.id);
        if(user != null) {
          controllerEdit.user.value = user;
          controllerEdit.name.text = user.name!;
          controllerEdit.surname.text = user.surname!;
          controllerEdit.username.text = user.username!;
          controllerEdit.email.text = user.email!;
          controllerEdit.role = user.role!;

          if (user.telephone != null) {
            controllerEdit.telephone.text = user.telephone.toString();
          } else {
            controllerEdit.telephone = TextEditingController();
          }

          if (user.dateBorn != null) {
            controllerEdit.dateborn.text = user.dateBorn.toString();
          } else {
            controllerEdit.dateborn = TextEditingController();
          }
        }        
        controllerHome.seeUsers.value = false;
        controllerHome.editUser.value = true;
      },
      child: Card(
        color: white,
        elevation: 5, 
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: _isHovered ? Theme.of(context).primaryColor : Colors.transparent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: MouseRegion(
          onEnter: (event) => setState(() => _isHovered = true),
          onExit: (event) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
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
                        style: titleBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(height: 20),
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
                                    style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                                  ),
                                  Text(
                                    widget.username,
                                    style: textBlackTextStyle
                                  ),
                                ],
                              ),                          
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    widget.prefixEmail,
                                    style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                                  ),
                                  Text(
                                    widget.email,
                                    style: textBlackTextStyle
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
                                    style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                                  ),
                                  Text(
                                    widget.role,
                                    style: textBlackTextStyle
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    widget.prefixTelephone,
                                    style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                                  ),
                                  Text(
                                    widget.telephone,
                                    style: textBlackTextStyle
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
                                    style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                                  ),
                                  Text(
                                    widget.dateBorn,
                                    style: textBlackTextStyle
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    widget.prefixLang,
                                    style: textBlackTextStyle.copyWith(fontWeight: FontWeight.bold)
                                  ),
                                  Text(
                                    widget.lang,
                                    style: textBlackTextStyle
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: _isHovered ? Theme.of(context).primaryColor : white,
                          ),
                        ],
                      ),
                    ],
                  ),
                )  
              ],
            ),
          ),
        )
      ),
    );
  }
}