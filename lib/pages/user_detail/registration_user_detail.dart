import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_application/pages/home/bottom_navigation/bottom_navgivation_bar.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimension_getx.dart';
import 'package:restaurant_application/utils/dimensions.dart';
import 'package:restaurant_application/widgets/inputdecoration_form.dart';
import 'package:restaurant_application/widgets/smalltext.dart';
import 'package:intl/intl.dart';

class RegistrationUserDetail extends StatefulWidget {
  const RegistrationUserDetail({Key? key}) : super(key: key);

  @override
  State<RegistrationUserDetail> createState() => _RegistrationUserDetailState();
}

class _RegistrationUserDetailState extends State<RegistrationUserDetail> {
  TextEditingController dateCtl = TextEditingController();
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.mainAppColor,
        title: Text('Profile Setup'),
        leading: BackButton(),
      ),
      body: Stack(
        children: [
          //Big Icon for profile.
          Positioned(
            left: 100,
            right: 100,
            top: 50,
            child: Container(
              height: 210,
              width: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: CustomColors.mainAppColor,
              ),
              child: CircleAvatar(
                backgroundColor: CustomColors.mainAppColor,
                child: imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          imageFile!,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: CustomColors.mainAppColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          //upload button for display picture.
          Positioned(
            top: 220,
            left: 220,
            right: 140,
            child: InkWell(
              onTap: () => _showPicker(),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black54,
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //TextField for user to fill in.
          Positioned(
            left: 0,
            right: 0,
            top: 300,
            child: Padding(
              padding: EdgeInsets.all(DimensionsGetx.height10),
              child: Column(
                children: [
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'User Name'),
                    //validating the text field.
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter user name';
                      }
                      return null;
                    },
                    //Called when the user initiates a change to the
                    //TextField's value: when they have inserted or deleted text.
                    // onChanged: (value) {
                    //   setState(() => email = value);
                    // },
                  ),
                  SizedBox(height: DimensionsGetx.height20),
                  TextFormField(
                    readOnly: true,
                    controller: dateCtl,
                    decoration: InputDecoration(
                      labelText: "Date of birth",
                      hintText: "Ex. Insert your dob",
                    ),
                    onTap: () async {
                      DateTime date = DateTime(1996);
                      FocusScope.of(context).requestFocus(
                        new FocusNode(),
                      );
                      date = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1996),
                        lastDate: DateTime(2030),
                      ))!;

                      dateCtl.text = date.toString();
                    },
                  ),

                  // TextFormField(
                  //   decoration:
                  //       textInputDecoration.copyWith(hintText: 'Date of Birth'),
                  //   //validating the text field.
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter D.O.B';
                  //     }
                  //     return null;
                  //   },
                  //   //Called when the user initiates a change to the
                  //   //TextField's value: when they have inserted or deleted text.
                  //   // onChanged: (value) {
                  //   //   setState(() => email = value);
                  //   // },
                  // ),
                  SizedBox(height: DimensionsGetx.height20),
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Phone No'),
                    //validating the text field.
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                    //Called when the user initiates a change to the
                    //TextField's value: when they have inserted or deleted text.
                    // onChanged: (value) {
                    //   setState(() => email = value);
                    // },
                  ),
                ],
              ),
            ),
          ),
          //Elevated Button for Finishing up setting for user.
          Positioned(
            bottom: 70,
            right: 30,
            child: SizedBox(
              height: DimensionsGetx.height45,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => BottomNavBar(),
                  //     ));
                },
                child: SmallText(
                  text: 'Finish',
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
          )
        ],
      ),
    );
  }

  //Image Picker
  void _showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
                child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.image_search),
                  title: SmallText(text: 'Gallery'),
                  onTap: () {
                    _getFromGallery();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt_rounded),
                  title: SmallText(text: 'Camera'),
                  onTap: () {
                    _getFromCamera();
                  },
                ),
              ],
            )),
          );
        });
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
