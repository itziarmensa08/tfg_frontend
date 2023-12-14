import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/modules/login/login_controller.dart';
import 'package:tfg_frontend/app/modules/login/widgets/login_form.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0), // El radio del CircleAvatar es 30, por eso usamos el mismo valor.
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.35, right: MediaQuery.of(context).size.width * 0.35),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0), // Aumenta el padding superior para el CircleAvatar
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 40), // Espacio adicional para el CircleAvatar
                      const Text('Inicio de sesión', style: title1TextStyle,),
                      const SizedBox(height: 40),
                      LoginForm(),
                      const SizedBox(height: 20),
                      TextButton(
                        child: const Text('¿Has olvidado la contraseña?', style: textDarkGrayTextStyle),
                        onPressed: () {
                          // Acción para recuperar contraseña
                        },
                      ),
                      TextButton(
                        child: const Text('¿Aún no tienes cuenta?', style: textDarkGrayTextStyle,),
                        onPressed: () {
                          // Acción para registrar una nueva cuenta
                        },
                      ),
                      Image.asset(
                        'assets/logo_flightline.png',
                        width: 100,
                        height: 100,
                      ) 
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
      ),
    );
  }
}