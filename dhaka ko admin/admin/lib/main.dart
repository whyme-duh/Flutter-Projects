import 'package:admin/authentication/wrapper.dart';
import 'package:admin/screens/analytics.dart';
import 'package:admin/screens/homepage.dart';
import 'package:admin/screens/manage.dart';
import 'package:admin/shared/constants.dart';
import 'package:admin/user/user.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/authService.dart';
import 'navigation/drawer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Admin());
}


class Admin extends StatefulWidget {
  const Admin({ Key? key }) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  
 
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserProfile?>.value(
      value: Authentication().user, 
      catchError: (_, __) => null,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: themeColor),
        home: Scaffold(
          backgroundColor: bgColor,
          body:Wrapper(),
          
          ),
        
        
      ),
    );
  }
}

