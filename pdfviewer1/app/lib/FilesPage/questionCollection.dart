import 'package:flutter/material.dart';

import '../constants.dart';

class QuestionCollection extends StatefulWidget {
  const QuestionCollection({ Key? key }) : super(key: key);

  @override
  _QuestionCollectionState createState() => _QuestionCollectionState();
}

class _QuestionCollectionState extends State<QuestionCollection> {
  
  List IIT = ['2076' , '2067', '2057'];
  @override
  Widget build(BuildContext context) {

    
    Map diffFiles = {};

    diffFiles = diffFiles.isNotEmpty ? diffFiles : ModalRoute.of(context)!.settings.arguments as Map;
    
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      child: ListView.builder(
        itemCount: diffFiles.length-1,
        itemBuilder: (context, index){
          String key = diffFiles.keys.elementAt(index );
          // while(diffFiles[key] != "q1"){
          //   count += 1;
          // }
          // print('$count, $index');
          // index = 0;
          // key = diffFiles.keys.elementAt(index + count);


          return  Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Card(
              color: Colors.black,
              child: ListTile(
                title: Text('${diffFiles[key]}', style: TextStyle(
                  color: LetterColor
                ),),
                onTap: () {
                    
                    // if there is only one pdf then oonly one is shown and vice versa
                    if (key == "q1"){
                      print(diffFiles["q1"]);
                      for( int i = 1; i< diffFiles.length -1; i++){

                        if (key == "q$i"){

                            Navigator.pushNamed(context,'/pdf', arguments: {
                              "pdf" : diffFiles["q$i"]
                            });
                        }
                      }
                    }
                   
                    
                  
                },
              ),
            ),
        );
        }
      ),
    );
  }
}