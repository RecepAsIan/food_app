import 'package:eat_meat/product/enums/widget_size.dart';
import 'package:flutter/material.dart';

class AdminInkwell extends StatelessWidget {
  const AdminInkwell({super.key, required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: WidgetSize.adminContainerSizeWidth.value.toDouble(),
        height: WidgetSize.adminContainerSizeHeight.value.toDouble(),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
