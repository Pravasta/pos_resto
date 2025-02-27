import 'package:flutter/material.dart';
import 'package:pos_resto/core/components/app_text_field.dart';
import 'package:pos_resto/feature/main_page/widget/drawer_widget.dart';
import 'package:pos_resto/main.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const RouteSettings routeSettings = RouteSettings(name: '/main-page');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
        backgroundColor: appColorScheme(context).primary,
        foregroundColor: appColorScheme(context).onPrimary,
      ),
      drawer: DrawerWidget(),
    );
  }
}
