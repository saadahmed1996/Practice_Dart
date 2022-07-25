import 'package:flutter/material.dart';
import 'package:restaurant_application/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_application/pages/authentication/authrizer.dart';
import 'package:restaurant_application/pages/authentication/email_verification.dart';
import 'package:restaurant_application/pages/authentication/sign_in.dart';
import 'package:restaurant_application/pages/home/bottom_navigation/bottom_navgivation_bar.dart';
import 'package:restaurant_application/pages/home/main_food_body.dart';

class Protector extends StatelessWidget {
  const Protector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Provider has been insitailized for authrizing registered users.
    final user = Provider.of<CustomFirebaseUser?>(context);

    //if the user value is null then it will auto redirect the new user to the sign up page.
    if (user == null) {
      return Authrizer();
      //else the user will redirected to the home screen page.
    } else {
      return EmailVerification();
    }
  }
}
