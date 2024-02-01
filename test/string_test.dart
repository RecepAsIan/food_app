import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('Sample Test', () {
    Map<String, dynamic> userDetails = {};
    Future<String> address() async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('address')
          .doc('GCi4zxbjjkP9tagNYLmF')
          .get()
          .then((val) {
        return userDetails.addAll(val.data as Map<String, dynamic>);
      }).whenComplete(() {
        print('Data Fetched');
      });
      print(userDetails);
      return userDetails['address'];
    }

    print(address());
  });
}
