import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pos_resto/core/components/app_text_field.dart';
import 'package:pos_resto/feature/auth/view/register_page.dart';

import '../../../core/components/app_button.dart';
import '../../../core/routes/navigation.dart';
import '../../../main.dart';
import '../../main_page/view/main_page.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget emailField() {
      return AppValidatorTextField(
        labelText: 'Email',
        hintText: 'Input your email',
        isMandatory: true,
        contentPadding: ContentPadding.all16,
        textFieldBorderStyle: TextFieldBorderStyle.fullBorder,
        controller: _emailController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email cannot be empty';
          }
          return null;
        },
      );
    }

    Widget passwordField() {
      return StatefulBuilder(
        builder: (context, setState) {
          return AppValidatorTextField(
            controller: _passwordController,
            labelText: 'Password',
            hintText: 'Input your password',
            isMandatory: true,
            isObscure: _isObscure,
            suffixWidget: IconButton(
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
            ),
            contentPadding: ContentPadding.all16,
            textFieldBorderStyle: TextFieldBorderStyle.fullBorder,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password cannot be empty';
              }
              return null;
            },
          );
        },
      );
    }

    Widget submitButton() {
      return DefaultButton(
        title: 'Login',
        onTap: () {
          if (_formKey.currentState!.validate()) {
            Navigation.push(const MainPage(), MainPage.routeSettings);
          }
        },
        borderRadius: 15,
        backgroundColor: appColorScheme(context).primary,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigation.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: appColorScheme(context).primary,
          ),
        ),
        title: Text(
          'Log in',
          style: appTextTheme(
            context,
          ).headlineMedium!.copyWith(color: appColorScheme(context).primary),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                spacing: 20,
                children: [emailField(), passwordField(), SizedBox(height: 20)],
              ),
              submitButton(),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: 'Don\'t have an account? ',
                  style: appTextTheme(context).titleSmall,
                  children: [
                    TextSpan(
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Navigation.push(
                                RegisterPage(),
                                RegisterPage.routeSettings,
                              );
                            },
                      text: 'Register',
                      style: appTextTheme(context).titleSmall!.copyWith(
                        color: appColorScheme(context).primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
