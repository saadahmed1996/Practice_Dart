import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_application/models/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_application/protector.dart';
import 'package:restaurant_application/services/auth.dart';
import 'models/user_model.dart';
import 'package:get/get.dart';

import 'pages/user_profile/user_profile_update.dart';

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
//03/AUG/2022