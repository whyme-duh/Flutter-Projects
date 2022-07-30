
import 'package:admin/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance; 

  UserProfile? _userFromFirebaseUser(User user){
    return user != null ? UserProfile(uid: user.uid) : null;
  }

  Stream<UserProfile?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
  }

  Future registerWithEmailPassword(String email, String password)async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? newUser = result.user;
      return _userFromFirebaseUser(newUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }

  }
  Future signWithEmailPassword(String email, String password)async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? newUser = result.user;
      return _userFromFirebaseUser(newUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }

  }

  Future signOut() async{
    try{
      await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    } 
  }

}