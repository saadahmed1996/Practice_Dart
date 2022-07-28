import 'package:firebase_auth/firebase_auth.dart';
<<<<<<< Updated upstream
=======
import 'package:restaurant_application/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
>>>>>>> Stashed changes

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

<<<<<<< Updated upstream
  //sign in anoy
  Future signInAnon() async {
=======
  //Create user obj based on FirebaseUser
  CustomFirebaseUser? _userFromFirebaseUser(User user) {
    return user != null ? CustomFirebaseUser(uid: user.uid) : null;
  }

  //Setup Stream for authchanges (if the user is currently logged in or logged out).
  //Maping each firebase value to our  custom user firebase obj.
  Stream<CustomFirebaseUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
>>>>>>> Stashed changes
    try {
      //_auth returns in UserCredential key
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
<<<<<<< Updated upstream
      return user;
=======

      // Shared Preference
      // getPef.set('currentuser;, user);
      //
      return _userFromFirebaseUser(user!);
>>>>>>> Stashed changes
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password

  //register with email & password
<<<<<<< Updated upstream
=======
  Future registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
 
  //Reset Password
  Future resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
>>>>>>> Stashed changes

  //signout
}
