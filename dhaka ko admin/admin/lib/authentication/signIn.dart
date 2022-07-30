
import 'package:admin/screens/loading.dart';
import 'package:admin/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'authService.dart';

class SignIn extends StatefulWidget {
  
  final Function toggleView;
  SignIn({required this.toggleView});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SignIn> {

  final Authentication _auth = Authentication();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool _passwordVisible = true;

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isLoading? Loading() : Scaffold(
      
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: size.width*0.65,
            child: Form(
              key : _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Container(
                      child: Image(
                        image: AssetImage('assets/dhaka.png'),
                        alignment: Alignment.center,
                        width:250,
                        height: 150,),
                    ),
                  ),
                  Text("ADMIN", style:TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w800
                  )),
                  SizedBox(height: size.height* 0.05),
                  
                  TextFormField(
                    
                    validator: (val) => val!.isEmpty ? "Email must be provided." : null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Enter your email",
                      labelText: "EMAIL"
                    ),
                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(height: size.height* 0.05),
                  
                  TextFormField(
                    validator: (val) => val!.length < 6 ? "Password does not match" : null,
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter Password",
                      labelText: "PASSWORD",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon:_passwordVisible ? Icon(Icons.visibility_off) :Icon(Icons.visibility) ,
                      )
                    ),
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    }
                    
                  ),
                  SizedBox(height: size.height* 0.05),
                  InkWell(
                    onTap: () async {
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          isLoading = true;
                      });
                      dynamic result = await _auth.signWithEmailPassword(email.trim(), password.trim());
                        if(result == null){
                          setState(() {
                            isLoading = false;
                            error = "* Your email or password does not match";
                          });
                        }
                      }
                      
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: BtnColor
                      ),
                      child: Align(
                        alignment:Alignment.center,
                        child: Text("SIGN IN",
                          style: GoogleFonts.lato(textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: FontColor
                            
                          )),  
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  Align(
                    alignment:Alignment.center,
                    child: Text(error, style:TextStyle(color: Colors.red, fontSize: 15,))),
                  SizedBox(height: size.height * 0.15,),
                  Text("Dont Have an Account ? ",style: TextStyle(color: Colors.black),),
                  SizedBox(height: size.height * 0.02),
                  InkWell(
                    onTap: () {
                      print("dsaf");
                      widget.toggleView();
                    },
                    child: Container(
                      width: size.width * 0.6,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: BtnColor
                      ),
                      child: Align(
                        alignment:Alignment.center,
                        child: Text("CREATE NEW ACCOUNT",
                          style: GoogleFonts.lato(textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: FontColor
                            
                          )),  
                        ),
                      ),
                    ),
                  ),
                  
                      
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}