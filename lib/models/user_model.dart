//Custom User model which will only provide Uid of the user and the rest of the stuff
//will be neglect.

class CustomFirebaseUser {
  final String uid;
  CustomFirebaseUser({required this.uid});
}