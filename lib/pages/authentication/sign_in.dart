import 'package:flutter/material.dart';
import 'package:restaurant_application/pages/authentication/reset_password.dart';
import 'package:restaurant_application/pages/authentication/sign_up.dart';
import 'package:restaurant_application/services/auth.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimension_getx.dart';
import 'package:restaurant_application/utils/dimensions.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
<<<<<<< Updated upstream
=======
import 'package:restaurant_application/widgets/inputdecoration_form.dart';
import 'package:restaurant_application/widgets/loading.dart';
>>>>>>> Stashed changes
import 'package:restaurant_application/widgets/smalltext.dart';
import 'package:restaurant_application/widgets/textField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //creating an instance  of the AuthService to call its function. A private variable _auth
  final AuthServices _auth = AuthServices();
<<<<<<< Updated upstream
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
          //Container for welcome heading
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                //color: Colors.yellowAccent,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Responsive.height(1.5, context),
                ),
                BigText(
                  text: 'W e l c o m e',
                  size: Responsive.height(10, context),
                ),
                SmallText(
                  text: 'Sign into your account',
                  size: Responsive.height(3.5, context),
                  color: Colors.black38,
                ),
              ],
            ),
          ),

          //Container for text field.
          Container(
            margin: EdgeInsets.only(
              top: Responsive.height(1, context),
              left: Responsive.height(3, context),
              right: Responsive.height(3, context),
            ),
            height: Responsive.height(18, context),
            decoration: BoxDecoration(
                //color: Colors.redAccent,
                ),
            child: Column(
              children: [
                CustomTextField(
                    isPassword: false,
                    text: 'Enter Your Name',
                    icon: Icons.person,
                    hintText: 'Enter Your Name'),
                SizedBox(
                  height: Responsive.height(1, context),
                ),
                CustomTextField(
                  isPassword: true,
                  text: 'Enter Your Password',
                  icon: Icons.lock,
                  hintText: 'Enter Your Password',
                ),
              ],
            ),
          ),

          //Container for forgot password.
          Container(
            height: Responsive.height(5, context),
            margin: EdgeInsets.only(
              left: Responsive.width(45, context),
            ),
            decoration: BoxDecoration(
                //color: Colors.yellowAccent,
                ),
            child: SmallText(
              text: 'Forgot Password',
              size: Responsive.height(3, context),
              color: Colors.black38,
            ),
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
              //Making a call to the anonymous fuction to trigger FirebaseAuth function called SignInAnonymously.
              onPressed: () async {
                //Saving it in result variable.
                dynamic result = _auth.signInAnon();
                //if the result is null then there is somethign went wrong.
                if (result == null) {
                  //when something went wrong printing this feedback to the user.
                  print('Error while signing in');
                } else {
                  //other wise user will sign in anonymously.
                  print('User Signed in');
                  //showing auto generated user id in the terminal.
                  print(result);
                }
              },
              child: SmallText(
                text: 'Sign In',
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
                  text: 'Dont have an account?',
                  size: Responsive.height(3, context),
                  color: Colors.black38,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  },
                  child: SmallText(
                    text: 'Create',
                    size: Responsive.height(3, context),
                    color: CustomColors.mainAppColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
=======
  //The form, provide a GlobalKey. This uniquely identifies the Form, and allows validation
  //of the form in a later step.
  final _formKey = GlobalKey<FormState>();
  //Initializing these two variables to use it as a validate the values.
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
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
                    //Container for welcome heading
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          //color: Colors.yellowAccent,
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Responsive.height(1.5, context),
                          ),
                          BigText(
                            text: 'W e l c o m e',
                            size: Responsive.height(5, context),
                          ),
                          SmallText(
                            text: 'Sign into your account',
                            size: Responsive.height(2.5, context),
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),

                    //Container for text field.
                    Container(
                      margin: EdgeInsets.only(
                        top: Responsive.height(1, context),
                        left: Responsive.height(3, context),
                        right: Responsive.height(3, context),
                      ),
                      height: Responsive.height(25, context),
                      decoration: BoxDecoration(
                          //color: Colors.redAccent,
                          ),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                            //validating the text field.
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                            //Called when the user initiates a change to the
                            //TextField's value: when they have inserted or deleted text.
                            onChanged: (value) {
                              setState(() => email = value);
                            },
                          ),
                          SizedBox(
                            height: Responsive.height(4, context),
                          ),
                          // CustomTextField(
                          //   isPassword: true,
                          //   text: 'Enter Your Password',
                          //   icon: Icons.lock,
                          //   hintText: 'Enter Your Password',
                          // ),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                            //validating the text field.
                            validator: (val) {
                              if (val!.length < 6) {
                                return 'Enter password with more than 6+ characters';
                              }
                              return null;
                            },
                            //Called when the user initiates a change to the
                            //TextField's value: when they have inserted or deleted text.
                            onChanged: (value) {
                              setState(() => password = value);
                            },
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),

                    //Container for forgot password.
                    Container(
                      height: DimensionsGetx.height45,
                      margin: EdgeInsets.only(
                        left: DimensionsGetx.screenWidth/2,
                      ),
                      decoration: BoxDecoration(
                          // color: Colors.yellowAccent,
                          ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPassword(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style:
                              TextStyle(color: CustomColors.secondaryTextColor),
                        ),
                      ),
                    ),
                    //Container for displaying error
                    Container(
                      child: SmallText(
                        text: error,
                        color: Colors.redAccent,
                      ),
                    ),
                    //Container for Sign in Button.
                    Padding(
                      padding: EdgeInsets.all(Responsive.height(2, context)),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          //Making a call to the anonymous fuction to trigger FirebaseAuth function called SignInAnonymously.
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.setString('email', email);
                              if (result == null) {
                                setState(() {
                                  error = 'Wrong Email & Password';
                                  loading = false;
                                });
                              }
                            }
                            // //Saving it in result variable.
                            // dynamic result = await _auth.signInAnon();
                            // //if the result is null then there is somethign went wrong.
                            // if (result == null) {
                            //   print('User Signed in');
                            //   //showing auto generated user id in the terminal.
                            //   print(result.uid);
                            // } else {
                            //   print('Error while signing in');
                            // }
                          },
                          child: SmallText(
                            text: 'LOGIN',
                            size: Responsive.height(2.5, context),
                            color: Colors.white,
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
                            text: 'Dont have an account?',
                            size: Responsive.height(2, context),
                            color: Colors.black38,
                          ),
                          TextButton(
                            onPressed: () {
                              widget.toggleView();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => SignUp(),
                              //   ),
                              // );
                            },
                            child: SmallText(
                              text: 'Create',
                              size: Responsive.height(2, context),
                              color: CustomColors.mainAppColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
>>>>>>> Stashed changes
  }
}
