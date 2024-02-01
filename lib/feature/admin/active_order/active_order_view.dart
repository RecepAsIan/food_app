import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_meat/feature/admin/active_order/active_order_riverpod.dart';
import 'package:eat_meat/product/utility/padding.dart';
import 'package:eat_meat/product/widgets/admin/active_order_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _activeOrderProvider =
    StateNotifierProvider<ActiveOrderNotifier, ActiveOrderView>((ref) {
  return ActiveOrderNotifier();
});

class ActiveOrderView extends ConsumerStatefulWidget {
  const ActiveOrderView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ActiveOrderViewState();
}

class _ActiveOrderViewState extends ConsumerState<ActiveOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ActiveOrder'),
      ),
      body: Padding(
        padding: AppPadding.pagePaddingLow,
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('order')
                  .doc(ref.read(_activeOrderProvider.notifier).formatTime())
                  .collection('orders')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child:
                          SizedBox.shrink(child: CircularProgressIndicator()));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('you don\'t have order'),
                  );
                }

                return Expanded(
                    child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final order = snapshot.data!.docs[index];
                    return ActiveOrderContainer(
                      userNameSurname: order["nameSurname"],
                      addressInfoText: order["userAddress"],
                      foodText: order["foodText"],
                      indexId: order.id,
                      image: order["foodImage"],
                    );
                  },
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
