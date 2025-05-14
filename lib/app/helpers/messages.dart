// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

class Messages {
  static void showMessage(BuildContext context, String message, Color backgroundColor, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
