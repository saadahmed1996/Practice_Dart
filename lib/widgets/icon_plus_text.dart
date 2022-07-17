import 'package:flutter/material.dart';
import 'package:restaurant_application/widgets/smalltext.dart';

//Creating a reusable icon and text widget horizontally.
class IconPlusText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  const IconPlusText({
    Key? key,
    required this.text,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(width: 5),
        SmallText(text: text),
      ],
    );
  }
}
