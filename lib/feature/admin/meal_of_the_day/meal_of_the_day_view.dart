import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_meat/feature/admin/meal_of_the_day/meal_of_the_day_riverpod.dart';
import 'package:eat_meat/product/constants/string_constants.dart';
import 'package:eat_meat/product/widgets/dialog_center.dart';
import 'package:eat_meat/product/widgets/food_container.dart';
import 'package:eat_meat/product/widgets/my_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _mealProvider =
    StateNotifierProvider<MealOFTheDayNotifier, MealOfTheDayView>((ref) {
  return MealOFTheDayNotifier();
});

class MealOfTheDayView extends ConsumerStatefulWidget {
  const MealOfTheDayView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MealOfTheDayViewState();
}

class _MealOfTheDayViewState extends ConsumerState<MealOfTheDayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.mealOFTHeDayView),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('food')
                .doc(ref.read(_mealProvider.notifier).docOne())
                .collection('foods')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: SizedBox.shrink(child: CircularProgressIndicator()));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Expanded(
                      flex: 1, child: Text('Today\'s menu is not loaded')),
                );
              }

              return Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final food = snapshot.data!.docs[index];
                    return ListTile(
                      leading: MyImage(imageText: food['foodImage']),
                      title: Text(food['foodText']),
                      trailing: IconButton(
                        icon: const Icon(Icons.close_outlined),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return DialogCenter(
                                text: StringConstants.youWantToRemoveThisMenu,
                                textLeft: 'back',
                                textRight: 'Remove Menu',
                                leftOnPressed: () {
                                  ref
                                      .read(_mealProvider.notifier)
                                      .exitButton(context);
                                },
                                rightOnPressed: () {
                                  ref
                                      .read(_mealProvider.notifier)
                                      .menuRemove(context, docTwo: food.id);
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const Text(StringConstants.chooseToDaysMeals),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: ref.read(_mealProvider.notifier).adminContainer.length,
              itemBuilder: (context, index) {
                final eat =
                    ref.read(_mealProvider.notifier).adminContainer[index];
                return FoodContainer(
                  containerColor: Theme.of(context).hintColor,
                  eatText: eat.foodText,
                  imageText: eat.imageText,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogCenter(
                          text:
                              'Should the ${eat.foodText} be added to today\'s meal? ,',
                          textLeft: 'back',
                          textRight: 'add to today\'s menu',
                          leftOnPressed: () {
                            ref
                                .read(_mealProvider.notifier)
                                .exitButton(context);
                          },
                          rightOnPressed: () {
                            ref.read(_mealProvider.notifier).addMenu(context,
                                foodText: eat.foodText,
                                foodImage: eat.imageText);
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
