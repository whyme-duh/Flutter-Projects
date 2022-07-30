import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';



class CategoryDb{
  
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  void createCategory(String name){

    var id = Uuid();
    String categoryId = id.v1();

    _firestore.collection('Categories').doc(categoryId).set({'categoryName' : name});
  }
}