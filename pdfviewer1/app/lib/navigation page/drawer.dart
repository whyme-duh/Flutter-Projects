import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

// this is the drawer function
class drawer extends StatefulWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  _drawerState createState() => _drawerState();
}
class _drawerState extends State<drawer> {


  
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Drawer(  
      child: ListView(
        children: <Widget>[ 
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Container(
              child:
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment:Alignment.bottomCenter,
                        child: Text('MENU',
                          style: GoogleFonts.akronim(textStyle:TextStyle(
                            fontSize: 50,
                            color:Colors.white)
                            )
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text('PRIME LIBARY',
                            style: GoogleFonts.bungeeHairline(textStyle:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color:LetterColor)
                              )
                          ),
                      ),
                    ],
                  ),
                ),

              decoration:BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight:Radius.circular(25)),
                color:ContainerColor
              ),
            )
            
          ),
          Container(
            child: Column(
              children: <Widget>[
                DrawerNav(title: "ABOUT US", navLink : "/home", iconName: Icon(Icons.person),),
                DrawerNav(title: "SETTINGS", navLink : "/settings",iconName: Icon(Icons.settings),),
                DrawerNav(title: "EXIT", navLink : "/home",iconName: Icon(Icons.exit_to_app),),
                


                
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerNav extends StatelessWidget {
  final String title;
  final iconName;
  final String navLink;

  const DrawerNav({
    Key? key,
    required this.title,
    required this.navLink,
    required this.iconName
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: () {
          Navigator.pushNamed(context, '$navLink');
        },
        // Navigator.pushNamed(context, navLink);
      child: Card(
        child: ListTile(
          leading: iconName,
          title: Text("$title",style: TextStyle(
            color: LetterColor
          ),
            )
        ),
      ),
    );
  }
}