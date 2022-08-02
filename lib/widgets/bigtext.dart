import 'package:flutter/material.dart';
import 'package:restaurant_application/utils/dimension_getx.dart';
import 'package:restaurant_application/utils/dimensions.dart';

//Reusable text widget for big font size.

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  TextOverflow overflow;
  BigText(
      {Key? key,
      this.color = const Color(0xFF131212),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        //fontSize: size,
        fontSize: size == 0 ? DimensionsGetx.font20 : size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
