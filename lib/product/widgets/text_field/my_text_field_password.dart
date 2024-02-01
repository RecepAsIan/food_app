import 'package:flutter/material.dart';

class MyTextFieldPassword extends StatefulWidget {
  const MyTextFieldPassword({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;

  @override
  State<MyTextFieldPassword> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextFieldPassword> {
  bool security = true;
  void animated() {
    setState(
      () {
        security = !security;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: security,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            animated();
          },
          icon: const Icon(Icons.remove_red_eye_outlined),
        ),
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
