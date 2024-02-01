import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({
    super.key,
    required this.imageText,
    this.height,
    this.scale,
  });
  final String imageText;
  final double? height;
  final double? scale;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageText,
      height: height,
      scale: scale ?? 1,
    );
  }
}
