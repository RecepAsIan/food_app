import 'package:flutter/material.dart';

class DrawerInkwell extends StatelessWidget {
  const DrawerInkwell({
    super.key,
    required this.text,
    required this.widget,
    required this.icon,
  });
  final String text;
  final Widget widget;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => widget,
          ),
        );
      },
      child: ListTile(
        leading: icon,
        title: Text(text),
      ),
    );
  }
}
