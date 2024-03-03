import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/data/model/user_model.dart';
import 'package:tfg_frontend/app/data/repository/home_repository.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/users/edit_user_form.dart';

class EditUserController extends GetxController {

  final HomeRepository repository;

  EditUserController(this.repository);
  
  final Rx<UserModel> user = UserModel().obs;

  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController dateborn = TextEditingController();

  DateTime? date;
  String? role;

}

class EditUser extends StatelessWidget {
  const EditUser({super.key});


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              const SizedBox(height: 30),
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
    );
  }
}