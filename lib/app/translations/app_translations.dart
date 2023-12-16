

import 'package:tfg_frontend/app/translations/ca_translations.dart';
import 'package:tfg_frontend/app/translations/en_translations.dart';
import 'package:tfg_frontend/app/translations/es_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> 
  translations = 
  {
    'en_US' : en,
    'es' : es,
    'ca': ca
  };
}