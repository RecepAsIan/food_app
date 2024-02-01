import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

mixin LoginMixin<T extends StatefulWidget> on State<T> {
  //TextEditingController
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void signIn({required String email, required String password}) {
    try {
      _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
