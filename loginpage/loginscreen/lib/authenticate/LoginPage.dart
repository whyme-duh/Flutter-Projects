import 'package:flutter/material.dart';
import 'package:loginscreen/authenticate/registeringNew.dart';
import 'package:loginscreen/shared/constants.dart';
import 'package:loginscreen/shared/loading.dart';
import 'package:loginscreen/userservice/authentication.dart';

class LoginPage extends StatefulWidget {

  final Function toggleView;
  LoginPage({required this.toggleView});
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();


  final Authentication _auth = Authentication();
  bool Isanimation = false;
  bool isLoading = false;

  //textField State
  String email = '';
  String password = '';
  String error = '';

  

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;


    return isLoading? Loading() :  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 50),
        child: Center(
          child: Container(
            height:size.height* 0.6,

            child: Form(
              key : _formKey,
              child: Column(
                children: <Widget>[
                  Text("LOGIN ", style: TextStyle(color:Colors.black,letterSpacing: 2, fontSize: 30,fontWeight: FontWeight.w600),),
                  SizedBox(height: 50,),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? "Enter email" : null,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Enter Your Email",
                      labelText: "EMAIL"
                    ),
                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: (val) => val!.length < 6 ? "Enter atleast 8 characters long " : null,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Enter password",
                      labelText: "PASSWORD"
                    ),
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: () async{
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          isLoading = true;
                        });
                        
                        // it will use the method create in authentication file , where email and password are passed as parameters
                        dynamic result = await _auth.signInwithEmailAndPassword(email.trim() ,password.trim());
                        if(result == null){
                          setState(() {
                            isLoading = false;
                            Isanimation = false;
                            error = 'Enter a Valid Email';
                          });
                        }
                        else{
                          setState(() {
                            error = '';
                          });
                        }
                        
                        
                      } 
                      await Future.delayed(Duration(seconds: 1));
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: Isanimation ? 40 : 100,
                      height: 40,
                      decoration:BoxDecoration(
                        color: Colors.green,
                        
                        borderRadius: BorderRadius.circular(Isanimation ? 20 : 8)
            
                      ),
                      alignment: Alignment.center,
                      child: Isanimation ? Icon(Icons.done) : Text("Login",
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2
                        ),),
            
                    ),
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                    child: Text("Create new ACCOUNT", style: TextStyle(letterSpacing: 2,fontSize: 15),),
                    onTap: () {
                      widget.toggleView();
            
                    },
                  ),
                  SizedBox(height: 30,),
                  Text(error,style: TextStyle(color: ErrorColor), )

            
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}