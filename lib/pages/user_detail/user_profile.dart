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
import 'package:restaurant_application/widgets/icon_plus_text.dart';
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
  bool loading = false;

  final RegistrationUserDetail registrationUserDetail =
      RegistrationUserDetail();
  FirebaseStorage storageReference = FirebaseStorage.instance;
  AuthServices _auth = AuthServices();
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final User? user = auth.currentUser;
  // final uid = user!.uid;

  Future _getDataFromFirestore() async {
    setState(() {
      loading = true;
    });
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
        loading = false;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DimensionsGetx.width15),
          child: loading
              ? Loading()
              : Column(
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
                              backgroundImage: imageUrl.isEmpty
                                  ? AssetImage('assets/image/about_us.png')
                                  : NetworkImage(imageUrl) as ImageProvider,
                            ),
                          ),
                          SizedBox(width: DimensionsGetx.width10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: 'User Profile'),
                              ElevatedButton.icon(
                                onPressed: () => auth.signOut(),
                                icon: Icon(Icons.logout),
                                label: Text('LOGOUT'),
                                style: ElevatedButton.styleFrom(
                                  primary: CustomColors.mainAppColor,
                                ),
                              ),
                              SizedBox(
                                width: DimensionsGetx.width10,
                              ),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.edit),
                                label: Text('EDIT PROFILE'),
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

                    Container(
                      height: DimensionsGetx.pageViewText,
                      //height: 120,
                      margin: EdgeInsets.only(
                        left: DimensionsGetx.width20,
                        right: DimensionsGetx.width20,
                        bottom: DimensionsGetx.height10,
                      ),
                      //using decoration box to round the container from the edges and give it a color.
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(DimensionsGetx.radius15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 140, 140, 140),
                            blurRadius: 5.0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: DimensionsGetx.height10,
                          left: DimensionsGetx.width10,
                          right: DimensionsGetx.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: DimensionsGetx.height20,
                            ),
                            //1st section of the 2nd container.
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BigText(text: 'Total Balance:'),
                                BigText(text: '2000/PKR'),
                              ],
                            ),
                            SizedBox(
                              height: DimensionsGetx.height10,
                            ),
                            //2nd section of the 2nd container.
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmallText(text: 'Food Ordered:'),
                                SmallText(text: '1279'),
                              ],
                            ),
                            SizedBox(height: DimensionsGetx.height20),
                            //3rd section of the 2nd container.
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: DimensionsGetx.width20,
                        right: DimensionsGetx.width20,
                        bottom: DimensionsGetx.height10,
                      ),
                      height: DimensionsGetx.listViewTextContainerSize,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(DimensionsGetx.radius15),
                        color: CustomColors.mainAppColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(DimensionsGetx.width15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Name: ' + Name,
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: DimensionsGetx.width20,
                        right: DimensionsGetx.width20,
                        bottom: DimensionsGetx.height10,
                      ),
                      height: DimensionsGetx.listViewTextContainerSize,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(DimensionsGetx.radius15),
                        color: CustomColors.mainAppColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(DimensionsGetx.width15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'DOB: ' + DOB,
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: DimensionsGetx.width20,
                        right: DimensionsGetx.width20,
                        bottom: DimensionsGetx.height10,
                      ),
                      height: DimensionsGetx.listViewTextContainerSize,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(DimensionsGetx.radius15),
                        color: CustomColors.mainAppColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(DimensionsGetx.width15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Phone No: ' + Phone,
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

// TODO: retreive an image from fire storage and show that image to the container.
// TODO: image should be retreive as per user UID.
