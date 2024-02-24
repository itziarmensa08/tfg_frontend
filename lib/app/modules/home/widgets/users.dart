// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/modules/home/widgets/user_card.dart';
import 'package:intl/intl.dart';

class UserList extends StatelessWidget {

  final RxList<UserModel> users;

  const UserList({
    Key? key,
    required this.users
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Text(
          'usersList'.tr,
          style: title1TextStyle,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Obx(() =>ListView.builder(
          shrinkWrap: true,
          itemCount: users.length, 
          itemBuilder: (context, index) {
            return UserCard(
              id: users[index].id!,
              name: '${users[index].name} ${users[index].surname}',
              prefixUsername: '${'username'.tr}: ',
              username: '${users[index].username}',
              prefixEmail: '${'email'.tr}: ',
              email: '${users[index].email}',
              prefixRole: '${'rol'.tr}: ',
              role: '${users[index].role}',
              prefixTelephone: '${'telephone'.tr}: ',
              telephone: '${users[index].telephone}' == 'null' ? 'notSpecified'.tr : '${users[index].telephone}',
              prefixBorn: '${'dateBorn'.tr}: ',
              dateBorn: '${users[index].dateBorn}' == 'null' ? 'notSpecified'.tr : DateFormat.yMMMd().format(users[index].dateBorn!),
              prefixLang: '${'language'.tr}: ',
              lang: '${users[index].language}'.tr,
              icon: Icons.person,
            );
          },
        )),
      ],
    );
  }
}

