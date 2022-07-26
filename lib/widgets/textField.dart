import 'package:flutter/material.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  double fontSize;
  final String hintText;
  final bool isPassword;

  CustomTextField({
    Key? key,
    required this.text,
    required this.icon,
    this.fontSize = 22,
    required this.hintText,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      obscureText: isPassword,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: CustomColors.mainAppColor,
        ),
        border: InputBorder.none,
        hintText: text,
        hintStyle: TextStyle(
          fontSize: Responsive.height(2, context),
          color: Colors.black38,
        ),
      ),
    );
  }
}
