import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_application/pages/user_detail/registration_user_detail.dart';
import 'package:restaurant_application/protector.dart';
import 'package:restaurant_application/services/auth.dart';
import 'package:restaurant_application/utils/colors.dart';
import 'package:restaurant_application/utils/dimension_getx.dart';
import 'package:restaurant_application/widgets/bigtext.dart';
import 'package:restaurant_application/widgets/loading.dart';
import 'package:restaurant_application/widgets/smalltext.dart';

class UpdateUserDetail extends StatefulWidget {
  const UpdateUserDetail({Key? key}) : super(key: key);

  @override
  State<UpdateUserDetail> createState() => _UpdateUserDetailState();
}

class _UpdateUserDetailState extends State<UpdateUserDetail> {
  String DOB = '';
  String Name = '';
  String Phone = '';
  String imageUrl = '';
  // bool loading = false;

  final RegistrationUserDetail registrationUserDetail =
      RegistrationUserDetail();
  FirebaseStorage storageReference = FirebaseStorage.instance;
  AuthServices _auth = AuthServices();
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final User? user = auth.currentUser;
  // final uid = user!.uid;
  bool loading = false;

  Future _getDataFromFirestore() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) async {
      setState(() {
        DOB = value.data()!["DOB"];
        Name = value.data()!["Name"];
        Phone = value.data()!["Phone"];
        imageUrl = value.data()!["imageUrl"];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.mainAppColor,
        title: BigText(
          text: 'Profile',
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(DimensionsGetx.width10),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(DimensionsGetx.width15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Container for displaying profile pic, user name, user id, and sign out button.
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: CustomColors.mainAppColor,
                    minRadius: 60.0,
                    child: CircleAvatar(
                      radius: 55.0,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                  ),
                  SizedBox(width: DimensionsGetx.width10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: 'Saad Ahmed'),
                      SmallText(text: 'Your Profile'),
                      ElevatedButton.icon(
                        onPressed: () => auth.signOut(),
                        icon: Icon(Icons.logout),
                        label: Text('LOGOUT'),
                        style: ElevatedButton.styleFrom(
                          primary: CustomColors.mainAppColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: DimensionsGetx.height20,
            ),
            Text(
              'Name: ' + Name,
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            SizedBox(
              height: DimensionsGetx.height20,
            ),
            Text(
              'DOB: ' + DOB,
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            SizedBox(
              height: DimensionsGetx.height20,
            ),
            Text(
              'Phone No: ' + Phone,
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: retreive an image from fire storage and show that image to the container.
// TODO: image should be retreive as per user UID.
