import 'package:flutter/material.dart';
import 'package:pos_resto/feature/auth/view/login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const RouteSettings routeSettings = RouteSettings(name: '/login');

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginView());
  }
}
