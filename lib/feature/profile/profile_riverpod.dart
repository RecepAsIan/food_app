import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_meat/feature/profile/profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileNotifier extends StateNotifier<ProfileView> {
  ProfileNotifier() : super(const ProfileView());
  final String text = 'asdasd';
  Future<String> getAddress() async {
    try {
      // Firestore belge referansını oluşturun
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('address')
          .doc(FirebaseAuth.instance.currentUser!.uid);

      // Firestore'dan belgeyi getirin
      DocumentSnapshot documentSnapshot = await documentReference.get();

      // Eğer belge varsa, "address" alanını al, yoksa boş bir string kullan
      String firebaseStringValue = documentSnapshot.exists
          ? (documentSnapshot.data() as Map<String, dynamic>)['address'] ?? ''
          : '';

      return firebaseStringValue;
    } catch (e) {
      // Hata durumunda işlemleri burada ele alabilirsiniz
      print('Firebase veri alınamadı: $e');
      return ''; // Hata durumunda boş bir string döndür
    }
  }
  Future<String> getNameSurname() async {
    try {
      // Firestore belge referansını oluşturun
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('address')
          .doc(FirebaseAuth.instance.currentUser!.uid);

      // Firestore'dan belgeyi getirin
      DocumentSnapshot documentSnapshot = await documentReference.get();

      // Eğer belge varsa, "address" alanını al, yoksa boş bir string kullan
      String firebaseStringValue = documentSnapshot.exists
          ? (documentSnapshot.data() as Map<String, dynamic>)['nameSurname'] ?? ''
          : '';

      return firebaseStringValue;
    } catch (e) {
      // Hata durumunda işlemleri burada ele alabilirsiniz
      print('Firebase veri alınamadı: $e');
      return ''; // Hata durumunda boş bir string döndür
    }
  }
}
