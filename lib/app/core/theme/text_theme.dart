
import 'package:flutter/material.dart';

const TextStyle title1TextStyle = TextStyle(
  fontFamily: 'Agrandir',
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Color(0xFFF3720A),
);

const TextStyle textDarkGrayTextStyle = TextStyle(
  fontFamily: 'Agrandir',
  fontSize: 16,
  color: Color(0xFFCBC8C8),
);

ButtonStyle buttonBlueStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF10619A)), // Color de fondo del botón
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Ajusta el relleno al que necesites
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5), // Ajusta el radio del borde al que necesites
    ),
  ),
);