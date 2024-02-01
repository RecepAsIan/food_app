import 'package:eat_meat/product/utility/padding.dart';
import 'package:eat_meat/product/widgets/drawer/admin_drawer_container.dart';
import 'package:eat_meat/product/widgets/drawer/draver_container.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Text('Normal User'),
            ),
            Padding(
              padding: AppPadding.paddingBottomLow,
              child: AdminContainer(),
            ),
            DrawerContainer()
          ],
        ),
      ),
    );
  }
}
