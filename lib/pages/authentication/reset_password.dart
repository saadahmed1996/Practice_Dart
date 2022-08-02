import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_application/services/auth.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimension_getx.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/inputdecoration_form.dart';
import 'package:restaurant_application/widgets/loading.dart';
import 'package:restaurant_application/widgets/smalltext.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(DimensionsGetx.width30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(text: 'Please Enter Your Email Address'),
                SizedBox(height: DimensionsGetx.height20),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Enter Email'),
                  // validating the text field.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  //Called when the user initiates a change to the
                  // TextField's value: when they have inserted or deleted text.
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                ),
                SizedBox(height: DimensionsGetx.height20),
                SizedBox(
                  width: double.maxFinite,
                  height: DimensionsGetx.height45,
                  //Reset Email Password
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth.resetPassword(email);
                        if (email != null) {
                          setState(() {
                            error = "Please Go Back and Check Your Email Inbox";
                          });
                        }
                      }
                    },
                    icon: Icon(Icons.email),
                    label: Text('Send Request'),
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.mainAppColor,
                    ),
                  ),
                ),
                SizedBox(height: DimensionsGetx.height20),
                SizedBox(
                  width: double.maxFinite,
                  height: DimensionsGetx.height45,
                  //Go Back Button
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    label: Text('Go Back'),
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.mainAppColor,
                    ),
                  ),
                ),
                SizedBox(height: DimensionsGetx.height10),
                SmallText(
                  text: error,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
