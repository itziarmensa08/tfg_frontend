import 'package:flutter/material.dart';
import 'package:tfg_frontend/app/core/theme/text_theme.dart';

Widget buildSeparator(BuildContext context, String title, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: color,
              thickness: 2,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              title,
              style: textWhiteTextStyle,
            ),
          ),
          Expanded(
            child: Divider(
              color: color,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }