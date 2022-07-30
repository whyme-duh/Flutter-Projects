import 'package:flutter/material.dart';


class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: ListView(
          children: [
            Container(
              height:size.height * 0.045,
              width: size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Change the name of the user : ", style: TextStyle(
                    fontSize: 15
                  ),),
                  TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        
                        hintText: "Enter Username...",
                        border: InputBorder.none,
                        
                        
                      ),
                    )
                ],
              )),
            Text("Settings "),
            Text("Settings "),

          ],
        ),
      ) ,
    );
  }
}