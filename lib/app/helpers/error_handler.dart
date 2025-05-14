// ignore_for_file: always_declare_return_types, inference_failure_on_function_return_type, type_annotate_public_apis, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/messages.dart';

class ErrorHandler {
  static handler(BuildContext context, int code, String message) {
    switch (code) {
      case 404:
        Messages.showMessage(context, message, Colors.red, Colors.white);
        break;
    }
  }
}
