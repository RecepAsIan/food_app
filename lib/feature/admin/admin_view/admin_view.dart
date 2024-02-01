import 'package:eat_meat/feature/admin/admin_view/admin_riverpod.dart';
import 'package:eat_meat/product/widgets/admin/admin_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _adminRiverpod = StateNotifierProvider<AdminNotifier, AdminView>((ref) {
  return AdminNotifier();
});

class AdminView extends ConsumerWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Admin View'),
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: adminInkwell.length,
          itemBuilder: (context, index) {
            final admin = adminInkwell[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AdminInkwell(
                text: admin.adminText,
                onTap: () async {
                  ref.read(_adminRiverpod.notifier).push(context, admin.onTap);
                },
              ),
            );
          },
        ));
  }
}
