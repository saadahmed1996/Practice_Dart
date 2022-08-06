import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_application/pages/home/bottom_navigation/bottom_navgivation_bar.dart';
import 'package:restaurant_application/protector.dart';
import 'package:restaurant_application/services/auth.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimension_getx.dart';
import 'package:restaurant_application/utils/dimensions.dart';
import 'package:restaurant_application/widgets/inputdecoration_form.dart';
import 'package:restaurant_application/widgets/loading.dart';
import 'package:restaurant_application/widgets/smalltext.dart';

import 'user_detail_registration.dart';

class UserProfileUpdate extends StatefulWidget {
  const UserProfileUpdate({Key? key}) : super(key: key);

  @override
  State<UserProfileUpdate> createState() => _UserProfileUpdateState();
}

class _UserProfileUpdateState extends State<UserProfileUpdate> {
  var userDataUploadedCompleted = '';
  bool userProfileUpdated = false;
  bool loading = false;
  final AuthServices _auth = AuthServices();
  FirebaseStorage storageReference = FirebaseStorage.instance;
  TextEditingController userName = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  File? imageFile;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: CustomColors.mainAppColor,
              title: Text('Profile Setup'),
              leading: BackButton(
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(DimensionsGetx.height10),
              child: Stack(
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
                            controller: userName,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'User Name'),
                            //validating the text field.
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter user name';
                              }
                              return null;
                            },
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
                          SizedBox(height: DimensionsGetx.height20),
                          TextFormField(
                            controller: phoneNo,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Phone No'),
                            //validating the text field.
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter phone no';
                              }
                              return null;
                            },
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
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          final User? user = auth.currentUser;
                          final uid = user!.uid;
                          if (uid != null) {
                            final result = await updateProfile();
                            if (result != false) {
                              loading = false;
                              Get.to(() => BottomNavBar());
                            } else {
                              Get.snackbar('Error', 'Error Saving User Info!');
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                    'User Id not found, Please sign out and register again.'),
                              ),
                            );
                          }
                        },
                        child: SmallText(
                          text: 'Update',
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
            ),
          );
  }

  //update fucntion for user to update his info OR profile.
  Future<bool> updateProfile() async {
    try {
      String? uploadedFileURL;
      Reference storageReference =
          FirebaseStorage.instance.ref().child('userprofile/');
      UploadTask uploadTask = storageReference.putFile(imageFile!);
      final result = await uploadTask;
      if (result.state == TaskState.success) {
        uploadedFileURL = (await storageReference.getDownloadURL()).toString();
        final User? user = auth.currentUser;
        final uid = user!.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid.toString())
            .update({
          'Name': userName.text,
          'DOB': dateCtl.text,
          'Phone': phoneNo.text,
          'imageUrl': uploadedFileURL,
        });
      }
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //Image Picker will work as swticher (as Camera and Gallery)
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
