import 'package:flutter/material.dart';
import 'package:pos_resto/feature/auth/view/register_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const RouteSettings routeSettings = RouteSettings(name: '/register');

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterView());
  }
}
