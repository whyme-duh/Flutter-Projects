import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../constants.dart';

class pdfSection extends StatefulWidget {
  const pdfSection({
    Key? key,
  }) : super(key: key);

  @override
  State<pdfSection> createState() => _pdfSectionState();
}

class _pdfSectionState extends State<pdfSection> {

  @override
  Widget build(BuildContext context) {
     CollectionReference users = FirebaseFirestore.instance.collection('CPROGRAM');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc('NOTES').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("${data['1']}");
        }

        return Text("loading");
      },
    );
  }
}