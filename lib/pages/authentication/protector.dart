import 'package:flutter/material.dart';
import 'package:restaurant_application/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_application/pages/authentication/sign_in.dart';
import 'package:restaurant_application/pages/home/bottom_navigation/bottom_navgivation_bar.dart';
import 'package:restaurant_application/pages/home/main_food_body.dart';

class Protector extends StatelessWidget {
  const Protector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomFirebaseUser?>(context);

    if (user == null) {
      return SignIn();
    } else {
      return BottomNavBar();
    }
  }
}
