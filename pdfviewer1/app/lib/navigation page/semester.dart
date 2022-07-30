import 'package:app/constants.dart';
import 'package:app/database/dbFunction.dart';
import 'package:flutter/material.dart';
class SemNumber extends StatelessWidget {
  final String semName;
  final String noOfFiles;


  const SemNumber({ Key? key , required this.semName,required this.noOfFiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DbFunction db = DbFunction();

    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        width: size.width* 0.9,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children : <Widget>[
            SizedBox(
              height: size.height * 0.065, 
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: SemColor
                ),
                onPressed: () {
                    db.createDb();

                    if (semName == "First Semester"){
                    Navigator.pushNamed(context, '/files',arguments: {
                        "title":"First Semester",
                        "subject_first" : "Introduction To Information Technology",
                        "subject_second" : "Maths 1",
                        "subject_third" : "Digital Logics",
                        "subject_fourth" :"Physics",
                        "subject_fifth" : "C Programming",
                    });
                  }
                  else if (semName == "Second Semester"){
                    Navigator.pushNamed(context, '/files',arguments: {
                        "title":"Second Semester",
                        "subject_first" : "Object Oriented Programming",
                        "subject_second" : "Linear Algebra",
                        "subject_third" : "Statistics 1",
                        "subject_fourth" :"Discrete Structure",
                        "subject_fifth" : "Microprocessor",

                    });
                  }
                  else if (semName == "Third Semester"){
                    Navigator.pushNamed(context, '/files',arguments: {
                        "title":"Third Semester",
                        "subejct_first" : "Data Structure Algorithm",
                        "subejct_second" : "Numerical Method",
                        "subejct_third" : "Statistics 2",
                        "subject_fourth" :"Computer Graphics",
                        "subject_fifth" : "Computer Architecture"
                    });
                  }
                    else if (semName == "Fourth Semester"){
                    Navigator.pushNamed(context, '/files',arguments: {
                        "title":"Fourth Semester",
                        "subejct_first" : "Data Structure Algorithm",
                        "subejct_second" : "Numerical Method",
                        "subejct_third" : "Statistics 2",
                        "subject_fourth" :"Computer Graphics",
                        "subject_fifth" : "Computer Architecture"
                    });
                  }
                },
                child: Container(
                  width: size.width* 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(text: TextSpan(
                          text: '$semName',
                          style: TextStyle(
                            color:LetterColor,
                            fontSize: 15,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w500
                          )
                        )),
                        RichText(text: TextSpan(
                          text: '$noOfFiles',
                          
                          style: TextStyle(
                            color:LetterColor,
                            fontSize: 15,
                            letterSpacing: 2
                        )
                      )),
                  ],),
                )),
            )
          ]
        ),
      ),
    );
  }
}

