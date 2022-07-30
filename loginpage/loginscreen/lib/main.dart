import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginscreen/authenticate/registeringNew.dart';
import 'package:loginscreen/models/user.dart';
import 'package:loginscreen/userservice/authentication.dart';
import 'package:loginscreen/wrapper.dart';
import 'package:provider/provider.dart';
import 'HomeScreen.dart';
import 'authenticate/LoginPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userprofile?>.value(
      catchError: (_, __)=> null,
      value: Authentication().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        // initialRoute: "/",
        // routes: {
        //   "/":(context) => LoginPage(),
        //   "/home": (context) =>HomeScreen(),
        //   "/register" : (context) => Register()
        // },
        home: Wrapper(),
        
      ),
    );
  }
}