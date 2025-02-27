import 'package:flutter/material.dart';
import 'package:pos_resto/core/components/app_button.dart';
import 'package:pos_resto/core/routes/navigation.dart';
import 'package:pos_resto/core/utils/assets.gen.dart';
import 'package:pos_resto/feature/auth/view/login_page.dart';
import 'package:pos_resto/feature/auth/view/register_page.dart';
import 'package:pos_resto/main.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'PosRESTO',
              style: appTextTheme(context).displayMedium!.copyWith(
                color: appColorScheme(context).primaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(Assets.images.introAsset.path, scale: 3),
            Text(
              'Easy Manage Your Restaurant',
              style: appTextTheme(context).headlineSmall,
            ),
            Column(
              spacing: 20,
              children: [
                DefaultButton(
                  title: 'Create new Account',
                  onTap: () {
                    Navigation.push(RegisterPage(), RegisterPage.routeSettings);
                  },
                  borderRadius: 15,
                  backgroundColor: appColorScheme(context).primary,
                ),
                DefaultButton(
                  title: 'Login',
                  onTap: () {
                    Navigation.push(const LoginPage(), LoginPage.routeSettings);
                  },
                  borderRadius: 15,
                  titleColor: appColorScheme(context).primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
