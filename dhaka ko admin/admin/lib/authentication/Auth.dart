import 'package:admin/authentication/register.dart';
import 'package:admin/authentication/signIn.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({ Key? key }) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Auth> {

  bool isSignIn = true;

  void toggleView(){
    setState(() {
      isSignIn = !isSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: isSignIn ? SignIn(toggleView : toggleView) : Register(toggleView: toggleView)
      
    );
  }
}