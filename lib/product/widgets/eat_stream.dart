import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_meat/feature/profile/profile_riverpod.dart';
import 'package:eat_meat/feature/profile/profile_view.dart';
import 'package:eat_meat/product/widgets/dialog_center.dart';
import 'package:eat_meat/product/widgets/food_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final _profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileView>((ref) {
  return ProfileNotifier();
});

class EatStream extends ConsumerWidget {
  const EatStream({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curretDate = DateTime.now();
    final String formattedDate = DateFormat('yyyy-MM-dd').format(curretDate);
    String formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm').format(curretDate);

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('food')
          .doc(formattedDate)
          .collection('foods')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: SizedBox.shrink(child: CircularProgressIndicator()));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('Today\'s menu is not loaded'),
          );
        }
        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final food = snapshot.data!.docs[index];
              return FoodContainer(
                containerColor: Theme.of(context).hintColor,
                eatText: food['foodText'],
                imageText: food['foodImage'],
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogCenter(
                        text:
                            'Are you sure to buy the ${food['foodText']} meal?',
                        textLeft: 'back ',
                        textRight: 'Buy',
                        leftOnPressed: () {
                          Navigator.of(context).pop();
                        },
                        rightOnPressed: () async {
                          FirebaseFirestore.instance
                              .collection('order')
                              .doc(formattedDate)
                              .collection('orders')
                              .add(
                            {
                              "foodText": food['foodText'],
                              "foodImage": food['foodImage'],
                              "userAddress": await ref
                                  .read(_profileProvider.notifier)
                                  .getAddress(),
                              "nameSurname": await ref
                                  .read(_profileProvider.notifier)
                                  .getNameSurname(),
                              "order time": formattedDateTime,
                            },
                          );
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
