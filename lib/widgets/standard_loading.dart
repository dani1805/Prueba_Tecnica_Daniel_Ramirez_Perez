import 'package:flutter/material.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/colors.dart';

class StandardLoading extends StatelessWidget {
  const StandardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(MColor.blue),
      ),
    );
  }
}
