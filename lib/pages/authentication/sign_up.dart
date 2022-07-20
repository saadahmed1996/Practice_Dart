import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimensions.dart';
import 'package:restaurant_application/widgets/smalltext.dart';
import 'package:restaurant_application/widgets/textField.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Container For Logo Image
          Container(
            height: Responsive.height(22, context),
            margin: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              //color: Colors.redAccent,
              image: DecorationImage(
                image: AssetImage('assets/image/logo part 1.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          //Container for text field.
          Container(
            margin: EdgeInsets.only(
              left: Responsive.height(3, context),
              right: Responsive.height(3, context),
            ),
            height: Responsive.height(36, context),
            decoration: BoxDecoration(
                //color: Colors.redAccent,
                ),
            child: Column(
              children: [
                CustomTextField(
                    isPassword: false,
                    text: 'Enter Your Email',
                    icon: Icons.email,
                    hintText: 'Enter Your Email'),
                SizedBox(
                  height: Responsive.height(1, context),
                ),
                CustomTextField(
                    isPassword: true,
                    text: 'Enter Your Password',
                    icon: Icons.lock,
                    hintText: 'Enter Your Password'),
                SizedBox(
                  height: Responsive.height(1, context),
                ),
                CustomTextField(
                    isPassword: false,
                    text: 'Enter Your Number',
                    icon: Icons.mobile_friendly,
                    hintText: 'Enter Your Number'),
                SizedBox(
                  height: Responsive.height(1, context),
                ),
                CustomTextField(
                  isPassword: false,
                  text: 'Enter Your Name',
                  icon: Icons.person,
                  hintText: 'Enter Your Name',
                ),
              ],
            ),
          ),
          SizedBox(
            height: Responsive.height(2, context),
          ),
          //Container for Sign in Button.
          Container(
            height: Responsive.height(9, context),
            width: Responsive.width(45, context),
            decoration: BoxDecoration(
                // color: Colors.redAccent,
                // borderRadius: BorderRadius.circular(
                //   Responsive.height(5, context),
                // ),
                ),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MainBody()),
                // );
              },
              child: SmallText(
                text: 'Sign Up',
                size: Responsive.height(5, context),
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                primary: CustomColors.mainAppColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Responsive.height(4, context),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Responsive.height(1.5, context),
          ),
          //Container to navigate to create new account.
          Container(
            height: Responsive.height(7, context),
            width: Responsive.width(85, context),
            decoration: BoxDecoration(
                //color: Colors.redAccent,
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(
                  text: 'Already have an',
                  size: Responsive.height(3, context),
                  color: Colors.black38,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: SmallText(
                    text: 'Account?',
                    size: Responsive.height(3, context),
                    color: CustomColors.mainAppColor,
                  ),
                ),
              ],
            ),
          ),
          //Footer text
          SmallText(
            text: 'Sign up using one of the following methods',
            size: Responsive.height(3, context),
            color: Colors.black38,
          ),
          SizedBox(height: Responsive.height(1, context)),
          //Footer Icon to register through different other social media links.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SignInButton(
                Buttons.LinkedIn,
                mini: true,
                onPressed: () {},
              ),
              // SizedBox(width: Responsive.width(3, context)),
              SignInButton(
                Buttons.Facebook,
                mini: true,
                onPressed: () {},
              ),
              SignInButton(
                Buttons.Twitter,
                mini: true,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
