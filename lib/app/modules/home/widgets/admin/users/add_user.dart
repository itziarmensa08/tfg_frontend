import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tfg_frontend/app/data/repository/register_repository.dart';
import 'package:tfg_frontend/app/modules/home/widgets/admin/users/add_user_form.dart';

class AddUserController extends GetxController {

  final RegisterRepository repository;

  AddUserController(this.repository);
  
  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password1 = TextEditingController();
  final TextEditingController password2 = TextEditingController();
  String? role;

}

class AddUser extends StatelessWidget {
  const AddUser({super.key});


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
              AddUserForm(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      )
    );
  }
}