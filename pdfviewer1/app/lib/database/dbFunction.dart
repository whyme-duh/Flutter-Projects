
import 'package:cloud_firestore/cloud_firestore.dart';

class DbFunction{

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<String> Subjects = ["IIT", 
  "DL",
  "CPOROGRAMING",
  "STATS","PHYSICS"
  ];

  List<String> NameId = [
    "Notes",
    "Syllabus", "Question Collection ", "Solution"
  ];

  void createDb(){
    for (var i = 0; i < Subjects.length; i++) {
      for (var j = 0; j < NameId.length; j++) {
        
        _firestore.collection(Subjects[i]).doc(NameId[j]).set({
          "Subject" : "sdf"
        });
        
      }
    
    }
  }

  

}