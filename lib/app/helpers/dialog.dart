import 'package:flutter/material.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_dialog.dart';

class MDialog {
  static void show({
    required BuildContext context,
    required Widget content,
    double? height,
    bool isBarrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isBarrierDismissible,
      builder:
          (_) => StandardDialog(
            content: content,
            height: height,
            isBarrierDismissible: isBarrierDismissible,
          ),
    );
  }
}
