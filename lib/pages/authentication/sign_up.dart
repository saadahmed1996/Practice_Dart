import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:restaurant_application/services/auth.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimensions.dart';
import 'package:restaurant_application/widgets/inputdecoration_form.dart';
import 'package:restaurant_application/widgets/loading.dart';
import 'package:restaurant_application/widgets/smalltext.dart';
import 'package:restaurant_application/widgets/textField.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({required this.toggleView});
  // const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //creating an instance  of the AuthService to call its function.
  //A private variable _auth
  final AuthServices _auth = AuthServices();
  //The form, provide a GlobalKey. This uniquely identifies the Form, and allows validation
  //of the form in a later step.
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
              SizedBox(
                height: Responsive.height(4, context),
              ),
              //Container for text field.
              Container(
                margin: EdgeInsets.only(
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
                      //validating the text field.
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an Email' : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      //Called when the user initiates a change to the
                      //TextField's value: when they have inserted or deleted text.
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    // CustomTextField(
                    //     isPassword: false,
                    //     text: 'Enter Your Email',
                    //     icon: Icons.email,
                    //     hintText: 'Enter Your Email'),
                    SizedBox(
                      height: Responsive.height(4, context),
                    ),
                    TextFormField(
                      obscureText: true,
                      //validating the text field.
                      validator: (val) => val!.length < 6
                          ? 'Enter an Password at least length of 6'
                          : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      //Called when the user initiates a change to the
                      //TextField's value: when they have inserted or deleted text.
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    // CustomTextField(
                    //     isPassword: true,
                    //     text: 'Enter Your Password',
                    //     icon: Icons.lock,
                    //     hintText: 'Enter Your Password'),
                    // SizedBox(
                    //   height: Responsive.height(1, context),
                    // ),
                    // CustomTextField(
                    //     isPassword: false,
                    //     text: 'Enter Your Number',
                    //     icon: Icons.mobile_friendly,
                    //     hintText: 'Enter Your Number'),
                    // SizedBox(
                    //   height: Responsive.height(1, context),
                    // ),
                    // CustomTextField(
                    //   isPassword: false,
                    //   text: 'Enter Your Name',
                    //   icon: Icons.person,
                    //   hintText: 'Enter Your Name',
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: Responsive.height(1, context),
              ),
              //Container for displaying error
              Container(
                child: SmallText(text: error, color:  Colors.redAccent,),
              ),
              //Container for Sign in Button.
              Padding(
                padding: EdgeInsets.all(Responsive.height(2, context)),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result =
                            await _auth.registerWithEmail(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Invalid Email Address';
                            loading = false;
                          });
                        }
                      }
                    },
                    child: SmallText(
                      text: 'REGISTER',
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
              SizedBox(
                height: Responsive.height(1, context),
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
                      size: Responsive.height(2, context),
                      color: Colors.black38,
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pop(context);
                        widget.toggleView();
                      },
                      child: SmallText(
                        text: 'Account?',
                        size: Responsive.height(2, context),
                        color: CustomColors.mainAppColor,
                      ),
                    ),
                  ],
                ),
              ),
              //Footer text
              SmallText(
                text: 'Sign up using one of the following methods',
                size: Responsive.height(2, context),
                color: Colors.black38,
              ),
              SizedBox(height: Responsive.height(2, context)),
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
        ),
      ),
    );
  }
}
