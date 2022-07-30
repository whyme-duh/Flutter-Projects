import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginscreen/models/exerciseModel.dart';

class Databases {

  final String uid;
  Databases({ required this.uid});

  // collection reference 
  final CollectionReference exerciseCollection = FirebaseFirestore.instance.collection('exercises');


  // creating a function to name the user in the database
  Future updataUserData(String name, int reps, int sets) async{
    return await exerciseCollection.doc(uid).set({
      'name' : name,
      'sets' : sets,
      'reps' : reps
    });  // it sets the database of the user with these datas
  }


  // list of exercise from the snapshots

  List <Exercise> _exerciseListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Exercise(
        name: doc.get('name') ?? " ", 
        reps: doc.get('reps') ?? 0, 
        sets: doc.get('sets') ?? 0);
    }).toList();
  }

  // get streams ,so it will the send the stream of data whenever the data are changed in the database : it is send to the home screen
  Stream<List<Exercise>> get exercise {
    return exerciseCollection.snapshots()
      .map(_exerciseListFromSnapshot);
  }

}