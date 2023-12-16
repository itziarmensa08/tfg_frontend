import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg_frontend/app/core/theme/color_theme.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';
import 'package:tfg_frontend/app/translations/app_translations.dart';

Widget buildLanguageDropdown() {
  var initialLanguage = Get.locale?.languageCode.obs;
  return DropdownButton<String>(
    value: initialLanguage?.value,
    onChanged: (language) async {
      Get.updateLocale(Locale(language!));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('language', language);
    },
    dropdownColor: gray,
    icon: const Icon(
      Icons.arrow_drop_down, 
      color: darkGray
    ),
    items: AppTranslation.translations.keys.map((String language) {
      return DropdownMenuItem<String>(
        value: language,
        child: Row(
          children: [
            Image.asset(
              'assets/$language.png',
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 8), 
            Text(language.tr, style: textDarkGrayTextStyle),
          ],
        ),
      );
    }).toList(),
  );
}