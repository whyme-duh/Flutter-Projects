import 'package:flutter/material.dart';
import 'package:loginscreen/authenticate/LoginPage.dart';
import 'package:loginscreen/authenticate/registeringNew.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({ Key? key }) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool isSignIn = true;

  void toggleview() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: isSignIn ? LoginPage(toggleView : toggleview) : Register(toggleView : toggleview),
      
    );
  }
}


