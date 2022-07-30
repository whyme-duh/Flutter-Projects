import 'package:app/constants.dart';
import 'package:app/sectionOfFile/passPdf.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FilesPage extends StatefulWidget {
  const FilesPage({ Key? key }) : super(key: key);

  @override
  _FilesPageState createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {


  Map semesterDetail = {} ;
  @override
  Widget build(BuildContext context) {
    semesterDetail = semesterDetail.isNotEmpty ? semesterDetail : ModalRoute.of(context)!.settings.arguments as Map;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ContainerColor,

      ),
      body: Column(
        children: [
           // this is used for the title of the page -> Which Semester Page are we in .....
            Container(
              height: size.height* 0.15,
              width: size.width,
              decoration: BoxDecoration(
                      color: ContainerColor,
                      borderRadius:  BorderRadius.only(bottomRight: Radius.circular(35), bottomLeft: Radius.circular(35))
                    ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '${semesterDetail['title']}',
                  style: GoogleFonts.lato(textStyle:TextStyle(
                  letterSpacing: 2,
                  fontSize: 30,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w800
                  ),
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "SUBJECTS", 
                style: GoogleFonts.actor(
                  textStyle:TextStyle(
                    fontSize: 30, 
                    color: Theme.of(context).accentColor,
                    fontWeight:FontWeight.w800))),
            ),
            new ListView.builder(
              shrinkWrap: true,
              itemCount: semesterDetail.length - 1, // here it just removes the title in the map 
              itemBuilder: (context, index){
                // index is increamented so that all the subjects can be added to the list View
                String mapKey = semesterDetail.keys.elementAt(index +1);

                return Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Card(
                  elevation: 2,
                  color:FileColor,
                  child: ListTile(
                    onTap: () {
                      // && semesterDetail['subject_first'] == "Introduction To Information Technology"
                      // FOR THE IIT
                      if (mapKey == "subject_first" ){
                        Navigator.pushNamed(context,'/allfiles', arguments: {
                          "title" : semesterDetail["subject_first"],
                        });
                       }
                      else if (mapKey == "subject_second" ){
                        Navigator.pushNamed(context,'/allfiles', arguments: {
                          "title" : semesterDetail["subject_second"],
                        });
                       }
                      else if (mapKey == "subject_third" ){
                        Navigator.pushNamed(context,'/allfiles', arguments: {
                          "title" : semesterDetail["subject_third"],
                        });
                       }
                    },
                  title: Text('${semesterDetail[mapKey]}',style: TextStyle(
                    color: LetterColor
                    ),
                  ),
                  // here we pass an arguments with the file to the pdf page
                  
              ),
            ),
          );
        }),
      ],
    ),
  );
}}

