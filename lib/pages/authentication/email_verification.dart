import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_application/pages/home/bottom_navigation/bottom_navgivation_bar.dart';
import 'package:restaurant_application/services/auth.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimensions.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/smalltext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final AuthServices _auth = AuthServices();
  bool isEmailVerified = false;
  bool resendingEmailVerification = false;
  Timer? timer;

  

//init state when this page called this will be the initial fucntion to launch.
  @override
  initState() {
    //getting current user which was sign up in isEmailVerified
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    //if the email is not verified then send auto verification link to the registered user when first launched.
    if (!isEmailVerified) {
      sendVerificationEmail();
      //checking if the email is verified or not after each 3 seconds.
      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVarified(),
      );
      super.initState();
    }
  }

//getting dispose of the timer once email is verified
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVarified() async {
    //reloading firebase user
    await FirebaseAuth.instance.currentUser!.reload();
    //setting state if its verified
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    //if user is verified then getting dispose of the timer.
    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      //setting state false once every 5 second so user wont spam for verification email link
      setState(() {
        resendingEmailVerification = false;
      });
      //delayed time
      await Future.delayed(Duration(seconds: 5));
      //setting state true once every 5 second so user wont spam for verification email link
      setState(() {
        resendingEmailVerification = true;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      //if the email is verified then show the menu page
      ? BottomNavBar()
      //else show the email verification page.
      : Scaffold(
          appBar: AppBar(
            title: BigText(
              text: 'Verify Email',
              color: Colors.white,
            ),
            backgroundColor: CustomColors.mainAppColor,
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(
                Responsive.height(2, context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallText(
                      text: 'A Verification email has been sent to your email'),
                  SizedBox(
                    height: Responsive.height(2, context),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Responsive.height(1.5, context)),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton.icon(
                        onPressed: resendingEmailVerification
                            ? sendVerificationEmail
                            : null,
                        icon: Icon(
                          Icons.email,
                          size: Responsive.height(3.5, context),
                        ),
                        label: SmallText(
                          text: 'Resend Email',
                          color: resendingEmailVerification
                              ? Colors.white
                              : Colors.black38,
                          size: Responsive.height(2, context),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: CustomColors.mainAppColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Responsive.height(1, context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Responsive.height(2, context),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Responsive.height(1.5, context)),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: CustomColors.mainAppColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Responsive.height(1, context),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _auth.signOut();
                        },
                        child: SmallText(
                            text: 'Cancel',
                            color: Colors.white,
                            size: Responsive.height(2, context)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
