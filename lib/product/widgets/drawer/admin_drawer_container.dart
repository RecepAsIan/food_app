import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_meat/feature/admin/admin_view/admin_view.dart';
import 'package:eat_meat/product/utility/padding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminContainer extends StatelessWidget {
  const AdminContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('admin')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('admincontainer')
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
          return const SizedBox(height: 10);
        }
        return Padding(
          padding: AppPadding.pagePaddingLow,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Padding(
              padding: AppPadding.pagePaddingLow,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AdminView(),
                          ),
                        );
                      },
                      child: const Text('admin'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
