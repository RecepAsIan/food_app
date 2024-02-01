import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_meat/feature/admin/meal_of_the_day/meal_of_the_day_view.dart';
import 'package:eat_meat/product/constants/image_constants.dart';
import 'package:eat_meat/product/constants/string_constants.dart';
import 'package:eat_meat/product/models/admin_container_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MealOFTheDayNotifier extends StateNotifier<MealOfTheDayView> {
  MealOFTheDayNotifier() : super(const MealOfTheDayView());
  final currentDate = DateTime.now();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Menu remove Fun
  void menuRemove(context,{required String docTwo}) {
    _firestore
        .collection('food')
        .doc(docOne())
        .collection('foods')
        .doc(docTwo)
        .delete();
        Navigator.of(context).pop();
  }

  //selected dishes
  String docOne() {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
    return formattedDate;
  }

  void selectedDishesStream() {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
    _firestore
        .collection('food')
        .doc(formattedDate)
        .collection('foods')
        .snapshots();
  }

  void exitButton(context) {
    Navigator.of(context).pop();
  }

  void addMenu(context, {required String foodText, required String foodImage}) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
    _firestore.collection('food').doc(formattedDate).collection('foods').add(
      {
        "foodText": foodText,
        "foodImage": foodImage,
      },
    );
    Navigator.of(context).pop();
  }

  List<AdminContainerModel> adminContainer = [
    AdminContainerModel(
      foodText: StringConstants.eatOne,
      imageText: ImageConstants.eatOne,
    ),
    AdminContainerModel(
      foodText: StringConstants.eatTwo,
      imageText: ImageConstants.eatTwo,
    ),
    AdminContainerModel(
      foodText: StringConstants.eatThree,
      imageText: ImageConstants.eatThree,
    ),
    AdminContainerModel(
      foodText: StringConstants.eatFour,
      imageText: ImageConstants.eatFour,
    ),
    AdminContainerModel(
      foodText: StringConstants.eatFive,
      imageText: ImageConstants.eatFive,
    ),
    AdminContainerModel(
      foodText: StringConstants.eatSix,
      imageText: ImageConstants.eatSix,
    ),
    AdminContainerModel(
      foodText: StringConstants.eatSeven,
      imageText: ImageConstants.eatSeven,
    ),
    AdminContainerModel(
      foodText: StringConstants.eatEight,
      imageText: ImageConstants.eatEight,
    ),
    AdminContainerModel(
      foodText: StringConstants.eatNine,
      imageText: ImageConstants.eatNine,
    ),
  ];
}
