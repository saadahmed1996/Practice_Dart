import 'package:flutter/material.dart';
import 'package:restaurant_application/pages/authentication/sign_in.dart';
import 'package:restaurant_application/pages/authentication/sign_up.dart';

class Authrizer extends StatefulWidget {
  const Authrizer({Key? key}) : super(key: key);

  @override
  State<Authrizer> createState() => _AuthrizerState();
}

class _AuthrizerState extends State<Authrizer> {
  bool checkSigninUser = true;

//making a function which will act as switch from sign in to sign up and sign up to sign
//in depends on the boolean value.
  void toggleView() {
    setState(() {
      checkSigninUser = !checkSigninUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (checkSigninUser) {
      return SignIn(toggleView: toggleView);
    } else {
      return SignUp(toggleView: toggleView);
    }
  }
}
