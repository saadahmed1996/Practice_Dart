import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_application/models/user_model.dart';
import 'package:restaurant_application/pages/authentication/authrizer.dart';
import 'package:restaurant_application/pages/authentication/email_verification.dart';
import 'package:restaurant_application/pages/home/main_food_body.dart';
import 'package:restaurant_application/protector.dart';
import 'package:restaurant_application/pages/home/bottom_navigation/bottom_navgivation_bar.dart';
import 'package:restaurant_application/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/authentication/reset_password.dart';
import 'pages/authentication/sign_in.dart';
import 'pages/authentication/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/user_model.dart';
import 'pages/food/popular_food_detail.dart';
import 'pages/food/recommended_food_detail.dart';
import 'pages/home/food_page_body.dart';
import 'package:get/get.dart';

import 'pages/user_detail/registration_user_detail.dart';
import 'pages/user_detail/udpate_user_detail.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Wraping it around the stream provider
    //The whole app will be connected to firebase through stream
    return StreamProvider<CustomFirebaseUser?>.value(
      catchError: (_, __) => null,
      value: AuthServices().user,
      initialData: null,
      child: GetMaterialApp(
        // //To remove debug banner it's annoying.
        debugShowCheckedModeBanner: false,
        home: Protector(),
      ),
    );
  }
}

//Changes made
//25-07-2022