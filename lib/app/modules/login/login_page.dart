import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/global_widgets/language_dropdown.dart';
import 'package:tfg_frontend/app/modules/login/login_controller.dart';
import 'package:tfg_frontend/app/modules/login/widgets/login_form.dart';
import 'package:tfg_frontend/app/routes/app_pages.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2, right: MediaQuery.of(context).size.width * 0.2),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(height: 40), 
                          Text('login'.tr, style: title1TextStyle,),
                          const SizedBox(height: 40),
                          LoginForm(),
                          const SizedBox(height: 20),
                          TextButton(
                            child: Text('forgotPass'.tr, style: textDarkGrayTextStyle),
                            onPressed: () {

                            },
                          ),
                          TextButton(
                            child: Text('notAccount'.tr, style: textDarkGrayTextStyle,),
                            onPressed: () {
                              Get.toNamed(Routes.register);
                            },
                          ),
                          Image.asset(
                            'assets/logo_flightline.png',
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(Icons.person, size: 70.0, color: Colors.white,),
                ),
              ],
            ),
            buildLanguageDropdown(),
          ],
        ),
      ),
    );
  }
}