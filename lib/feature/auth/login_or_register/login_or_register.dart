import 'package:eat_meat/feature/auth/login_or_register/login/login.dart';
import 'package:eat_meat/feature/auth/login_or_register/register/register.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginView(onPressed: togglePages);
    } else {
      return RegisterView(onPressed: togglePages);
    }
  }
}
