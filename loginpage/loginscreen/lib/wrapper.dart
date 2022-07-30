import 'package:flutter/material.dart';
import 'package:loginscreen/HomeScreen.dart';
import 'package:loginscreen/authenticate/LoginPage.dart';
import 'package:loginscreen/authenticate/auth.dart';
import 'package:loginscreen/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<Userprofile?>(context);

    //either return the home or login page , if login in then home or login
    return user == null ? Authenticate() : HomeScreen();
  }
}