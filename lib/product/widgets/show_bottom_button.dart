import 'package:flutter/material.dart';

import '../utility/padding.dart';

class ShowBottomButton extends StatelessWidget {
  const ShowBottomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.pagePaddingLow,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
