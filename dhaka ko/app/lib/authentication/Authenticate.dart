import 'package:app/authentication/register.dart';
import 'package:app/authentication/signIn.dart';
import 'package:flutter/cupertino.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({ Key? key }) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

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