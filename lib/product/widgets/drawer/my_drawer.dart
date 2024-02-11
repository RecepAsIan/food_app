import 'package:eat_meat/feature/home/home_view.dart';
import 'package:eat_meat/feature/profile/profile_view.dart';
import 'package:eat_meat/product/widgets/drawer/admin_drawer_container.dart';
import 'package:eat_meat/product/widgets/drawer/drawer_inkwell.dart';
import 'package:eat_meat/product/widgets/drawer/drawer_signout.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      width: 250,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    child: Text('Normal User'),
                  ),
                  AdminContainer(),
                  DrawerInkwell(
                      text: 'Home', icon: Icon(Icons.home), widget: HomeView()),
                  DrawerInkwell(
                      text: 'Profile',
                      icon: Icon(Icons.supervised_user_circle),
                      widget: ProfileView()),
                ],
              ),
            ),
            DrawerSignOut()
          ],
        ),
      ),
    );
  }
}
