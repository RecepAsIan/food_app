import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_meat/feature/profile/profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileNotifier extends StateNotifier<ProfileView> {
  ProfileNotifier() : super(const ProfileView());

  ///address  info
  Future<String> getAddress() async {
    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('address')
          .doc(FirebaseAuth.instance.currentUser!.uid);

      DocumentSnapshot documentSnapshot = await documentReference.get();

      String firebaseStringValue = documentSnapshot.exists
          ? (documentSnapshot.data() as Map<String, dynamic>)['address'] ?? ''
          : '';

      return firebaseStringValue;
    } catch (e) {
      print('Firebase veri alınamadı: $e');
      return ''; 
    }
  }
  ///name surname info
  Future<String> getNameSurname() async {
    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('address')
          .doc(FirebaseAuth.instance.currentUser!.uid);

      DocumentSnapshot documentSnapshot = await documentReference.get();

      String firebaseStringValue = documentSnapshot.exists
          ? (documentSnapshot.data() as Map<String, dynamic>)['nameSurname'] ?? ''
          : '';

      return firebaseStringValue;
    } catch (e) {
      print('Firebase veri alınamadı: $e');
      return ''; 
    }
  }
}
