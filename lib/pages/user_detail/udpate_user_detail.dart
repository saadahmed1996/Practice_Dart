import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_application/pages/user_detail/registration_user_detail.dart';
import 'package:restaurant_application/utils/dimension_getx.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/smalltext.dart';

class UpdateUserDetail extends StatefulWidget {
  const UpdateUserDetail({Key? key}) : super(key: key);

  @override
  State<UpdateUserDetail> createState() => _UpdateUserDetailState();
}

class _UpdateUserDetailState extends State<UpdateUserDetail> {
  @override
  Widget build(BuildContext context) {
    final RegistrationUserDetail registrationUserDetail =
        RegistrationUserDetail();

    FirebaseStorage storageReference = FirebaseStorage.instance;

    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: 'Profile',
          color: Colors.white,
        ),
        actions: [
          Icon(Icons.settings),
          SizedBox(width: DimensionsGetx.width10),
          Icon(Icons.search),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: DimensionsGetx.width10,
                right: DimensionsGetx.width10,
                top: DimensionsGetx.height10),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent,

                    // image: DecorationImage(image: NetworkImage(image)),
                  ),
                ),
                SizedBox(width: DimensionsGetx.width10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Saad Ahmed'),
                    SmallText(text: 'Your Profile'),
                    ElevatedButton.icon(
                      onPressed: () => loadImage(),
                      icon: Icon(Icons.abc_outlined),
                      label: Text('Print Image URL'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Loading an image from Firebase & returning it in var = url
Future<String> loadImage() async {
  //current user id
  final _userID = FirebaseAuth.instance.currentUser!.uid;

  //collect the image name
  DocumentSnapshot variable =
      await FirebaseFirestore.instance.collection('users').doc(_userID).get();

  //a list of images names (i need only one)
  // var _file_name = variable['userprofile/'];

  //select the image url
  Reference ref = FirebaseStorage.instance.ref().child("users/${_userID}");
  //get image url from firebase storage
  var url = await ref.getDownloadURL();
  print('url: ' + url);
  return url;
}


// TODO: retreive an image from fire storage and show that image to the container.
// TODO: image should be retreive as per user UID.


