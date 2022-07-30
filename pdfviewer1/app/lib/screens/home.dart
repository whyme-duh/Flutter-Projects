// import 'package:app/constants.dart';
import 'package:app/FilesPage/theme/ChangeButtonWidget.dart';
import 'package:app/navigation%20page/semester.dart';
import 'package:app/provider/themeprovider.dart';
// import 'package:app/pdflist.dart';
// import 'package:app/startUp.dart';
import 'package:app/user/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'navigation page/semester.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import '../FilesPage/allfiles.dart';
// import '../FilesPage/subjects.dart';
// import 'main.dart';
// import '../navigation page/bottomnavigation.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../navigation page/drawer.dart';


void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<HomePage> {
  bool isDark = false;

  Map data = {};
  
  
  @override
  Widget build(BuildContext context) {

    

    // data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    var size = MediaQuery.of(context).size;
    
    String name = "USER".toUpperCase();   // is taken from the startup name and displayed on the home screen
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) =>IconButton(
                    icon: Image.asset('assets/logo/menu.png'),
                    onPressed: () =>Scaffold.of(context).openDrawer(),
                  ),
                ),
                Row(
                  children: [
                    ChangeButtonWidget(),
                    IconButton(
                      icon:Icon(Icons.search),
                      onPressed: () {

                        showSearch(
                          context: context, 
                          delegate: CustomSearchDelegate());
                      },),
                  ],
                ),
    
              ],
            ),
          ),
          ),
        
        resizeToAvoidBottomInset:false,
        // bottomNavigationBar:BottomNavigator(),
        
        drawer: new drawer(),
        body:  SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Container(
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius:  BorderRadius.only(bottomRight: Radius.circular(35), bottomLeft: Radius.circular(35))
                  ),
                  child: 
                    SafeArea(
                      child:Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: size.height * 0.03 ),
                            child: Align(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  text: "WELCOME, \n ${name}" ,
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 35,
                                      color: Theme.of(context).accentColor, 
                                      fontWeight: FontWeight.w900))
                                  )
                                )
                              ),
                            ),
                          // SizedBox(
                          //   width:size.width * 0.75,
                          //   child: TextFormField(
                          //     onTap: () {
                          //       showSearch(
                          //         context: context, 
                          //         delegate: CustomSearchDelegate());
                          //       // Navigator.push(context,MaterialPageRoute(builder: (context) => SearchPage()));
                          //       // Navigator.pushNamed(context, '/searchpage');
                          //     },
                          //     style: TextStyle(color: LetterColor),
                          //     decoration: InputDecoration(
                          //       prefixIcon: Icon(Icons.search),
                          //       filled: true,
                          //       hintText: "Search",
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(20),
                          //       )
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20,20, 10),
                  child: Text("CHOOSE SEMESTER", style: GoogleFonts.abel(textStyle: TextStyle(letterSpacing: 2, 
                  color : Theme.of(context).accentColor, fontWeight: FontWeight.w600, fontSize: 30))),
                ),
                Container(
                  height: size.height * 0.66,
                  width: size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      children: <Widget>[
                        SemNumber(semName: "First Semester", noOfFiles: "5 Subject",),
                        SizedBox(height: 10,),
                        SemNumber(semName: "Second Semester" , noOfFiles: "5 Subject"),
                        SizedBox(height: 10,),
                        SemNumber(semName: "Third Semester", noOfFiles: "5 Subject"),
                        SizedBox(height: 10,),
                        SemNumber(semName: "Fourth Semester", noOfFiles: "5 Subject"),
                        SizedBox(height: 10,),
                        SemNumber(semName: "Fifth Semester", noOfFiles: "5 Subject"),
                        SizedBox(height: 10,),
                        SemNumber(semName: "Sixth Semester", noOfFiles: "5 Subject"),
                        SizedBox(height: 10,),
                        SemNumber(semName: "Seventh Semester", noOfFiles: "5 Subject"),
                        SizedBox(height: 10,),
                        SemNumber(semName: "Eigth Semester", noOfFiles: "5 Subject"),
                        SizedBox(height: 10,),
                        
                      
                      ],
                    ),
                  ),
                )
              ]
            ),
        ),
      );
            
           
      
  }
}





