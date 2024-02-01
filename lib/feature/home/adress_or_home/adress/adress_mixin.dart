import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

mixin AddressMixin<T extends StatefulWidget> on State<T> {
  //il
  final TextEditingController province = TextEditingController();
  //ilce
  final TextEditingController district = TextEditingController();
  //neighbourhood
  final TextEditingController neighbourhood = TextEditingController();
  //address
  final TextEditingController address = TextEditingController();
  //user name surname
  final TextEditingController nameSurname = TextEditingController();

  final _userId = FirebaseAuth.instance.currentUser!.uid;
  //save address
  void saveAddress({
    required String province,
    required String district,
    required String neighbourhood,
    required String address,
    required String nameSurname,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(_userId)
        .collection('address')
        .doc(_userId)
        .set(
      {
        "province": province,
        "district": district,
        "neighbourhood": neighbourhood,
        "address": address,
        "nameSurname": nameSurname
      },
    );
  }
}
