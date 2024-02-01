import 'package:eat_meat/product/constants/string_constants.dart';
import 'package:eat_meat/product/utility/padding.dart';
import 'package:eat_meat/product/widgets/drawer/my_drawer.dart';
import 'package:eat_meat/product/widgets/eat_stream.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('homeView'),
      ),
      body: const Padding(
        padding: AppPadding.pagePaddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(StringConstants.menuOnMealDay),
            EatStream(),
          ],
        ),
      ),
    );
  }
}
