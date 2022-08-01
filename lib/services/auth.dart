import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurant_application/models/user_model.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  //sign in anonymously
  // Future signInAnon() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     User? user = result.user;
  //     return _userFromFirebaseUser(user!);
  //   } catch (e) {
  //     //print(e.toString());
  //     return null;
  //   }
  // }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
<<<<<<< Updated upstream
=======
      // Shared Preference
      // getPef.set('currentuser;, user);
>>>>>>> Stashed changes
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
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

  //signout function
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
