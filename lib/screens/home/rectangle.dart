import 'package:flutter/material.dart';

class MyRectangle extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final GestureTapCallback onTap;

  MyRectangle(
      {required this.color,
      required this.width,
      required this.height,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        color: color,
        margin: EdgeInsets.all(8),
      ),
    );
  }
}
