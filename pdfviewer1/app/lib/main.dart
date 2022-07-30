import 'package:app/FilesPage/allfiles.dart';
import 'package:app/FilesPage/subjects.dart';
import 'package:app/constants.dart';
import 'package:app/database/dbFunction.dart';
import 'package:app/provider/themeprovider.dart';
import 'package:app/screens/loading.dart';
import 'package:app/pdflist.dart';
import 'package:app/screens/settings.dart';
import 'package:app/user/searchPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation page/drawer.dart';
import 'package:provider/provider.dart';

import 'screens/home.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PdfViewer());
  }


class PdfViewer extends StatefulWidget {
  const PdfViewer({ Key? key }) : super(key: key);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {

  DbFunction _db = DbFunction();

  @override
  void initState(){
    super.initState();

  }


  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder : (context, _){
      final themeProvider = Provider.of<ThemeProvider>(context, listen : false);

    return MaterialApp(
      
      themeMode:themeProvider.themeMode ,
      theme: light ? ThemeData(
        primaryColor: ContainerColor,
        
        
      ) : ThemeData.dark(),
      debugShowCheckedModeBanner:false,
      
      initialRoute: '/home',
      routes: {
        // '/':(context) => StartUp(),
        '/home': (context) =>HomePage(),
        '/files':(context) => FilesPage(),
        '/pdf' : (context) => PDF(),
        '/allfiles' : (context) => AllFiles(),
        '/loading':(context) =>Loading(),
        '/settings':(context) =>Settings(),
      },
        
        
        
        
        
      );
    }
  );
}