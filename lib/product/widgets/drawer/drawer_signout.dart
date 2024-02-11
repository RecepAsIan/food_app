import 'package:eat_meat/feature/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerSignOut extends StatelessWidget {
  const DrawerSignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FirebaseAuth.instance.signOut();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AuthPage(),
          ),
        );
      },
      child: ListTile(
        leading: Icon(Icons.exit_to_app_outlined),
        title: Text('Sign Out'),
      ),
    );
  }
}
