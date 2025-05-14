import 'package:flutter/material.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/login/login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: LoginView(),
        ),
      ),
    );
  }
}
