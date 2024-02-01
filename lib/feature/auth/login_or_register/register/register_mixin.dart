import 'package:eat_meat/product/constants/string_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

mixin RegisterMixin<T extends StatefulWidget> on State<T> {
  //TextEditingController
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ///user register
  void signUp(
      {required String email,
      required String password,
      required String confirmPassword}) {
    if (password == confirmPassword) {
      _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(StringConstants.passwordsDidNotMatch),
        ),
      );
    }
  }
}
