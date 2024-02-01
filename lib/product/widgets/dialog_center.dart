import 'package:eat_meat/product/utility/padding.dart';
import 'package:eat_meat/product/widgets/show_bottom_button.dart';
import 'package:flutter/material.dart';

class DialogCenter extends StatelessWidget {
  const DialogCenter({
    super.key,
    required this.text,
    required this.textLeft,
    required this.textRight,
    required this.leftOnPressed,
    required this.rightOnPressed,
  });
  final String text;
  final String textLeft;
  final String textRight;
  final void Function()? leftOnPressed;
  final void Function()? rightOnPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Text(text),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: AppPadding.paddingRightLow,
                  child: ShowBottomButton(
                      text: textLeft, onPressed: leftOnPressed),
                ),
                ShowBottomButton(text: textRight, onPressed: rightOnPressed),
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
