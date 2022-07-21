import 'package:flutter/material.dart';

//Reusable text widget for small font size.

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double height;
  SmallText(
      {Key? key,
      required this.text,
      this.size = 12,
      this.color = const Color(0xFF2e2e2e),
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size,
        color: color,
        height: height,
      ),
    );
  }
}
