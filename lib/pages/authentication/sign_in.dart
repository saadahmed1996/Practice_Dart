import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/widgets/app_icon.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/smalltext.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo area.
          Container(
            height: 180,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/logo part 1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Text area.
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Hello", size: 40),
                  SizedBox(height: 10),
                  SmallText(text: 'Sign into your account', size: 18,),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          //textfield container
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(),
            child: Column(
              children: [
                //User name text field
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: CustomColors.mainAppColor,
                      labelText: 'Enter Name',
                      hintText: 'Enter Your Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //password text field
                SizedBox(
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: CustomColors.mainAppColor,
                      labelText: 'Enter Password',
                      hintText: 'Enter Your Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //Sign into your account text
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: Text('Sign into your account'),
                  ),
                ),
                SizedBox(height: 30),
                //Button signin
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: CustomColors.mainAppColor,
                        onSurface: CustomColors.mainAppColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () {},
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
