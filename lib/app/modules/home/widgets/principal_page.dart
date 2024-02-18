import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/routes/app_pages.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          child: Column (
            children: [
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Acción para la búsqueda
                        },
                        icon: const Icon(Icons.search, color: darkGray,),
                      ),
                      Text('Buscar...', style: textDarkGrayTextStyle,),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Acción para el icono de notificación
                        },
                        icon: const Icon(Icons.notifications, color: darkGray),
                        hoverColor: gray,
                      ),
                      const SizedBox(width: 10,),
                      IconButton(
                        onPressed: () {
                          // Acción para el icono de ayuda
                        },
                        icon: const Icon(Icons.help, color: darkGray),
                        hoverColor: gray,
                      ),
                      const SizedBox(width: 10,),
                      IconButton(
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.remove('token');
                          prefs.remove('id');
                          prefs.remove('language');
                          prefs.remove('isAdmin');
                          Get.toNamed(Routes.login);
                        },
                        icon: const Icon(Icons.logout, color: darkGray),
                        hoverColor: gray,
                      ),
                      const SizedBox(width: 10,),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10,)
            ],
          )
          
        ),
      ],
    );    
  }
}
