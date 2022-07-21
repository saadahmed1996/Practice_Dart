import 'package:flutter/material.dart';
import 'package:restaurant_application/pages/food/popular_food_detail.dart';
import 'package:restaurant_application/pages/home/main_food_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //To remove debug banner it's annoying.
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PopularFoodDetail(),
    );
  }
}
