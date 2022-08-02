import 'package:flutter/material.dart';
import 'package:restaurant_application/utils/dimension_getx.dart';
import 'package:restaurant_application/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  const AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundColor = const Color(0xfffcf4e4),
      this.iconColor = const Color(0xff756d54),
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.width(10, context),
      height: Responsive.height(6, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: size == 0 ? DimensionsGetx.iconSize24 : size,
      ),
    );
  }
}
