import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_meat/feature/home/adress_or_home/adress/address_view.dart';
import 'package:eat_meat/feature/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddressOrHome extends StatelessWidget {
  const AddressOrHome({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('address')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox.shrink(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const AddressView();
        }
        return const HomeView();
      },
    );
  }
}
