import 'package:app/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // user object with the 
  

  UserProfile? _userFormFirebaseUser(User user){
    return user != null ? UserProfile(uid: user.uid) : null;
  }
  Stream<UserProfile?> get user {
    return _auth.authStateChanges().map((User? user) => _userFormFirebaseUser(user!) );
  }


  // for the registration with the email and password
  Future registerWithEmailPassword(String email, String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? newUser = result.user;
      return _userFormFirebaseUser(newUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //for the signin with the email and password
  Future signInWithEmailPassword(String email, String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? newUser = result.user;
      return _userFormFirebaseUser(newUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //for the sign out
  Future signOut() async{
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}