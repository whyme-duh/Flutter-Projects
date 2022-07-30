// here we use firebase package


import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginscreen/database/databases.dart';
import 'package:loginscreen/models/user.dart';

class Authentication {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on Firebase User
  Userprofile? _userFromFireBaseUser(User user){
    return user != null ? Userprofile(uid: user.uid) : null;
  }
  

  // auth change user stream, everytime the user signin or sign out it will gives us the stream of users

  Stream<Userprofile?> get user {
    return _auth.authStateChanges()
      .map((User? user) => _userFromFireBaseUser(user!));
  }

  
  // for the signing anomously
  Future sigInAnonmously() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFireBaseUser(user!);
      // 
    } 
    catch(e) {
      print(e.toString());
      return null;

    }
  }

  // for the email and password sign in 
  Future signInwithEmailAndPassword(String email, String password) async{ 
    try {
       // AuthResult is replaced by UserCredentials
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password) ; 
      User? newUser = result.user;
      return _userFromFireBaseUser(newUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  


  // registering new account with email and password
  Future registerWithEmailPassword(String email, String password) async{ 
    try {
       // AuthResult is replaced by UserCredentials
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);   
      User? newUser = result.user;

      // create a new document for th use with the uid
      await Databases(uid: newUser!.uid).updataUserData("Squat", 25, 7);
      return _userFromFireBaseUser(newUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  // for the signing out 
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

}
