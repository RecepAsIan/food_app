import 'package:eat_meat/feature/profile/profile_view.dart';
import 'package:eat_meat/product/utility/padding.dart';
import 'package:flutter/material.dart';

class DrawerContainer extends StatelessWidget {
  const DrawerContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
                        builder: (context) => const ProfileView(),
                      ),
                    );
                  },
                  child: const Text('profile view'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
