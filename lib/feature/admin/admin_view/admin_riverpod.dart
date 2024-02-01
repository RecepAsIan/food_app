import 'package:eat_meat/feature/admin/active_order/active_order_view.dart';
import 'package:eat_meat/feature/admin/admin_view/admin_view.dart';
import 'package:eat_meat/feature/admin/meal_of_the_day/meal_of_the_day_view.dart';
import 'package:eat_meat/product/constants/string_constants.dart';
import 'package:eat_meat/product/models/admin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminNotifier extends StateNotifier<AdminView> {
  AdminNotifier() : super(const AdminView());

  void push(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
    );
  }
}

List<AdminModel> adminInkwell = [
  const AdminModel(
    adminText: StringConstants.mealOfTheDay,
    onTap: MealOfTheDayView(),
  ),
  const AdminModel(
    adminText: StringConstants.activeOrder,
    onTap: const ActiveOrderView(),
  ),
  // const AdminModel(
  //   adminText: StringConstants.pastDaysOrder,
  //   onTap: PastDaysOrderView(),
  // ),
];
