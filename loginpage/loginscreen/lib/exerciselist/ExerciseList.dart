import 'package:flutter/material.dart';
import 'package:loginscreen/models/exerciseModel.dart';
import 'package:provider/provider.dart';


class ExerciseList extends StatefulWidget {
  const ExerciseList({ Key? key }) : super(key: key);

  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  @override
  Widget build(BuildContext context) {
    final exercises = Provider.of<List<Exercise>>(context) ;
    if (exercises.isNotEmpty){
      exercises.forEach((exercise) {
      print(exercise.name);
      print(exercise.reps);
      print(exercise.sets);

      });
    }
    
    
    return Container(
      
    );
  }
}