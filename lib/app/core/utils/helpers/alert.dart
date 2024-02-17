import 'package:flutter/material.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';

Future<void> showAlert(
  BuildContext context, 
  String title, 
  String message, 
  String button1,
  String? button2,
  Color color,
  VoidCallback onPressedButton1,
  VoidCallback? onPressedButton2) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: color,
        title: Text(title, style: titleWhiteTextStyle),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message, style: textWhiteTextStyle),
            ],
          ),
        ),
        actions: <Widget>[
          if (button2 != null)
          TextButton(
            onPressed: onPressedButton2,
            child: Text(button2, style: textWhiteTextStyle),
          ),
          TextButton(
            onPressed: onPressedButton1,
            child: Text(button1, style: textWhiteTextStyle)
          ),
        ],
      );
    },
  );
}