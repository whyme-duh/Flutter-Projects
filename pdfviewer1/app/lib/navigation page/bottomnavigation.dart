
import 'package:app/screens/home.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
        decoration:BoxDecoration(

          color: ContainerColor,
          boxShadow:[BoxShadow(
            color:Colors.grey.withOpacity(0.5),
            blurRadius: 7,
            spreadRadius:0.9,
            offset: Offset(0,5)
      )],),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

           InkWell(
             child: Icon(Icons.settings),
              onTap:() {
              print("settings");
            }),
            InkWell(
              child: Icon(Icons.home),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage()));
              },),
            Icon(Icons.settings),
            Icon(Icons.library_add)
          ],
        ),
      ),

      
    );
  }
}


