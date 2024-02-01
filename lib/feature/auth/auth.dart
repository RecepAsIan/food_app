import 'package:eat_meat/feature/auth/login_or_register/login_or_register.dart';
import 'package:eat_meat/feature/home/adress_or_home/address_or_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const AddressOrHome();
        } else {
          return const LoginOrRegister();
        }
      },
    );
  }
}
