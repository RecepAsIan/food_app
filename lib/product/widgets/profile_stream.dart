import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileStream extends StatelessWidget {
  const ProfileStream({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('address')
          .doc(userId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Expanded(
            child: Center(
              child: SizedBox.shrink(child: CircularProgressIndicator()),
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text('bakacaz'),
          );
        }
        var userDocument = snapshot.data!;
        var userName = userDocument['nameSurname'];
        var address = userDocument['address'];
        return Column(
          children: [
            ListTile(
              leading: const Icon(Icons.accessibility_new_rounded),
              title: Text('User Name : $userName'),
            ),
            ListTile(
              leading: const Icon(Icons.maps_home_work_outlined),
              title: Text(address),
            )
          ],
        );
      },
    );
  }
}
