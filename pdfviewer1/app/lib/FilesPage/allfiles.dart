// import 'package:google_fonts/google_fonts.dart';
// import 'package:app/sectionOfFile/QC.dart';
import 'package:app/FilesPage/questionCollection.dart';
import 'package:app/constants.dart';
import 'package:app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notes.dart';


class AllFiles extends StatefulWidget {
  const AllFiles({ Key? key }) : super(key: key);

  @override
  _AllFilesState createState() => _AllFilesState();
}

class _AllFilesState extends State<AllFiles> {

  Map diffFiles = {};
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    diffFiles = diffFiles.isNotEmpty ? diffFiles : ModalRoute.of(context)!.settings.arguments as Map;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar:FloatingActionButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home),
                Text("HOME", style: TextStyle(fontSize: 10),)
              ],
            ),
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              });
            },
          ),
          appBar: AppBar(
            backgroundColor:ContainerColor,
            title: Text("${diffFiles['title']}",),
            elevation: 0,
            bottom: TabBar(
              
              unselectedLabelColor: Colors.white,
              indicatorSize:TabBarIndicatorSize.label ,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
                  color: Colors.white),
              isScrollable: true,
              tabs: [
                BarTab(title:"Notes"),
                BarTab(title:"Syllabus"),
                BarTab(title:"Question Collections"),
                BarTab(title:"Solutions"),
                
              ],
              ),
            
            ),
          body: TabBarView(
            children: [
              pdfSection(),
              pdfSection(),
              QuestionCollection(),
              pdfSection(),

              
       
            ]
          )
        )
    );
  }
}



// this if for the tab bar
class BarTab extends StatelessWidget {
  final String title;
  const BarTab({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(child:
     Padding(
       padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
       child: Align(
        alignment: Alignment.center,
        child: Text("$title",style: TextStyle(color: TabColor),))
        
     ),
    );
  }
}