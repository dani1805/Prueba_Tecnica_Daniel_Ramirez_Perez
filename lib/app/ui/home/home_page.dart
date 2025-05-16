import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: HomeView(),
        ),
      ),
    );
  }
}
