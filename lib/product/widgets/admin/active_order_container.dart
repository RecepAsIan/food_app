import 'package:eat_meat/product/utility/padding.dart';
import 'package:flutter/material.dart';

class ActiveOrderContainer extends StatelessWidget {
  const ActiveOrderContainer({
    super.key,
    required this.addressInfoText,
    required this.foodText,
    required this.indexId,
    required this.image,
    required this.userNameSurname,
  });
  final String addressInfoText;
  final String userNameSurname;
  final String foodText;
  final String indexId;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: AppPadding.paddingRight5 + AppPadding.paddingLeft5,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('userName:'),
                Padding(
                  padding: AppPadding.paddingBottomLow,
                  child: Text('Food :'),
                ),
                Padding(
                  padding: AppPadding.paddingBottomLow,
                  child: Text('Address :'),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userNameSurname),
              Padding(
                padding: AppPadding.paddingBottomLow,
                child: Text(foodText),
              ),
              SizedBox(
                width: 250,
                child: Text(
                  addressInfoText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check_circle_outline_outlined,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
