// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/database/databases.dart';
import 'package:loginscreen/userservice/authentication.dart';
import 'package:provider/provider.dart';

import 'exerciselist/ExerciseList.dart';
import 'models/exerciseModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<HomeScreen> {

  final Authentication _auth = Authentication();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamProvider<List<Exercise>>.value(
      initialData: [],
      value: Databases(uid: '').exercise,
      child: Scaffold(
        appBar: AppBar(
          title: Text("PumpNepal"),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(child: Text("MENU")),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * 0.8,
                  height: size.height * 0.05,
                  color: Colors.grey,
                  child: InkWell(
                    onTap: () async{
                      await _auth.signOut();
                    },
                    child: Text('LOGOUT',
                      style: TextStyle(fontSize: 20),)),
                ),
              )
            ],
          ),
        ),
      body: ExerciseList(), 
      
      ),
    );
  }
}