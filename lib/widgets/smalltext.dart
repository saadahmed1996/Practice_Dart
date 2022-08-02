import 'package:flutter/material.dart';
import 'package:restaurant_application/utils/dimension_getx.dart';
import 'package:restaurant_application/utils/dimensions.dart';

//Reusable text widget for small font size.

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double height;
  SmallText(
      {Key? key,
      required this.text,
      this.size = 0,
      this.color = const Color(0xFF2e2e2e),
      this.height = 1.6 })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(AdaptiveTextSize.getadaptiveTextSize(context, size));
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        //fontSize: size,
        fontSize: size == 0 ? DimensionsGetx.font16 : size,
        color: color,
        height: height,
      ),
    );
  }
}
