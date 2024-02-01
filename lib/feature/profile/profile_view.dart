import 'package:eat_meat/feature/profile/profile_riverpod.dart';
import 'package:eat_meat/product/utility/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileView>((ref) {
  return ProfileNotifier();
});

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileView'),
      ),
      body: Padding(
        padding: AppPadding.pagePaddingLow,
        child: Column(
          children: [
            Text('asdasd'),
          ],
        ),
      ),
    );
  }
}
