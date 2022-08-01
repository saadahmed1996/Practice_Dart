import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_application/models/user_model.dart';
import 'package:restaurant_application/protector.dart';
import 'package:restaurant_application/pages/home/bottom_navigation/bottom_navgivation_bar.dart';
import 'package:restaurant_application/services/auth.dart';
import 'pages/authentication/sign_in.dart';
import 'pages/authentication/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/user_model.dart';

<<<<<<< Updated upstream
Future main() async  {
=======
import 'pages/user_detail/registration_user_detail.dart';
import 'pages/user_detail/udpate_user_detail.dart';

Future main() async {
>>>>>>> Stashed changes
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Wraping it around the stream provider
    //The whole app will be connected to firebase through stream
    return StreamProvider<CustomFirebaseUser?>.value(
      catchError: (_, __) => null,
      value: AuthServices().user,
      initialData: null,
      child: MaterialApp(
        // title: 'Flutter Demo',
        // //To remove debug banner it's annoying.
<<<<<<< Updated upstream
        // debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: Protector(),
=======
        debugShowCheckedModeBanner: false,
        home: RegistrationUserDetail(),
>>>>>>> Stashed changes
      ),
    );
  }
}

//Changes made
//25-07-2022