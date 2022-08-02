import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:restaurant_application/utils/colors.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      child: Center(
        child: SpinKitChasingDots(
          color: CustomColors.mainAppColor,
          size: 50.0,
        ),
        ),
      );
  }
}