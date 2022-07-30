
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void loading() async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState(){
    super.initState(); 
    loading();
    
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child:Container(
              child: Column(
                children: [
                  Container(
                height: size.height * 0.45,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:  BorderRadius.only(bottomRight: Radius.circular(35), bottomLeft: Radius.circular(35))
                ),
                child: 
                  SafeArea(
                    child:Container(
                      
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: RichText(
                            text: TextSpan(
                              text: "WELCOME TO \nPRIME LIBARY",
                              
                              style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 35,color: Theme.of(context).accentColor , fontWeight:FontWeight.w900))
                              )
                            ),
                        )
                        ),
                      ),
                    ),
                    
                ),
                  SizedBox(height: size.height * 0.25),
                  SpinKitChasingDots(
                    color: Colors.black,
                  ),
                ],
              ),
            ) ,
          ),
          
            
          ),
      )
    );
    
  }
}