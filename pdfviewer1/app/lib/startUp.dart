import 'package:app/user/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';


class StartUp extends StatefulWidget {
  const StartUp({ Key? key }) : super(key: key);

  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {

  final myController = TextEditingController();

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
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
            SizedBox(height: size.height * 0.12,),
            Container(
              height: size.height* 0.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter As:',
                        style: GoogleFonts.aBeeZee(textStyle:TextStyle(
                          color:Theme.of(context).accentColor,
                          fontSize: 20,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600
                        ),)
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: myController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        
                        hintText: "Enter Username...",
                        border: InputBorder.none,
                        
                        
                      ),
                    )
                    ,SizedBox(height: 40,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ButtonColor
                      ),
                      onPressed: () {
                        setState(() {
                          myController.text;
                          Navigator.pushReplacementNamed(context, '/home');
                          // , arguments: {
                          //   'name' : myController.text == '' ? "USER" : myController.text.toUpperCase()  // it checks if the user inputs the data , if not then returns "User" to the home page
                          // }
                        });
                      }, 
                      child: Text("ENTER")
                    ),
                    Spacer(flex: 1,),
                    RichText(
                      text: TextSpan(
                        text: "Note: You can enter without any name.",
                        style: TextStyle(
                          color:LetterColor,
                          letterSpacing: 2,
                          fontSize: 10
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
      
      
    );
  }
}