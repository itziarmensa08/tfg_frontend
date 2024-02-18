import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/modules/edit-user/edit_user_controller.dart';
import 'package:tfg_frontend/app/modules/edit-user/widgets/edit_user_form.dart';

class EditUserPage extends GetView<EditUserController> {
  const EditUserPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('editUser'.tr, style: titleWhiteTextStyle),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                const SizedBox(height: 10),
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(Icons.person, size: 70.0, color: Colors.white,),
                ),
                const SizedBox(height: 40),
                EditUserForm(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        )
      )
    );
  }
}