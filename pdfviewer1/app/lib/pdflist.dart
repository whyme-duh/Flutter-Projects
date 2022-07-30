import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PDF extends StatefulWidget {

  @override
  _PDFState createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  Map pdfList = {};

  @override
  Widget build(BuildContext context) {
    // it takes the arguments from the  routed page and place it into the Map 
    pdfList = pdfList.isNotEmpty ? pdfList : ModalRoute.of(context)!.settings.arguments as Map;
    print(pdfList[1]);
    return Scaffold(
        appBar: AppBar(
          title:Text("PDF viewer"),
        ),
        //we acces the map details 
        //here ${pdfList['file']} == file name for the required subject
      body:Center(child: SfPdfViewer.asset('assets/${pdfList['pdf']}'),)
    );
  }
}