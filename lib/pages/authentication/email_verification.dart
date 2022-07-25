import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_application/pages/home/bottom_navigation/bottom_navgivation_bar.dart';
import 'package:restaurant_application/services/auth.dart';
import 'package:restaurant_application/utils/dimensions.dart';
import 'package:restaurant_application/widgets/app_icon.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/smalltext.dart';

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

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVarified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVarified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        resendingEmailVerification = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        resendingEmailVerification = true;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? BottomNavBar()
      : Scaffold(
          appBar: AppBar(
            title: BigText(text: 'Verify Email'),
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
                  ElevatedButton.icon(
                    onPressed: resendingEmailVerification
                        ? sendVerificationEmail
                        : null,
                    icon: Icon(Icons.email),
                    label: SmallText(text: 'Resend Email'),
                  ),
                  SizedBox(
                    height: Responsive.height(2, context),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _auth.signOut();
                    },
                    child: SmallText(text: 'Cancel'),
                  ),
                ],
              ),
            ),
          ),
        );
}
