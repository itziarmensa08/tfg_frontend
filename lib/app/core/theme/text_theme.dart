
import 'package:flutter/material.dart';

const TextStyle title1TextStyle = TextStyle(
  fontFamily: 'Agrandir',
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Color(0xFFF3720A),
);

const TextStyle titleWhiteTextStyle = TextStyle(
  fontFamily: 'Agrandir',
  fontSize: 24,
  color: Colors.white,
);

const TextStyle titleBlackTextStyle = TextStyle(
  fontFamily: 'Agrandir',
  fontSize: 24,
  color: Colors.black,
);

const TextStyle textDarkGrayTextStyle = TextStyle(
  fontFamily: 'Agrandir',
  fontSize: 16,
  color: Color.fromARGB(255, 180, 179, 179),
);

const TextStyle textWhiteTextStyle = TextStyle(
  fontFamily: 'Agrandir',
  fontSize: 16,
  color: Colors.white,
);

const TextStyle textPrimaryColorTextStyle = TextStyle(
  fontFamily: 'Agrandir',
  fontSize: 16,
  color: Color(0xFF10619A),
);

const TextStyle textBlackTextStyle = TextStyle(
  fontFamily: 'Agrandir',
  fontSize: 16,
  color: Colors.black,
);

const TextStyle textOrangeTextStyle = TextStyle(
  fontFamily: 'Agrandir',
  fontSize: 16,
  color: Color(0xFFF3720A),
);

ButtonStyle buttonBlueStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF10619A)),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  ),
);

ButtonStyle buttonGrayStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFE6E6E6)),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  ),
);