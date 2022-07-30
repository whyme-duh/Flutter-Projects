import 'package:admin/authentication/authService.dart';
import 'package:admin/screens/loading.dart';
import 'package:admin/shared/constants.dart';
import 'package:flutter/material.dart';



class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final Authentication _auth = Authentication();
  final _formKey = GlobalKey<FormState>();

  bool Isanimation = false;
  bool isLoading = false;

  String email= '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  isLoading ? Loading() : Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading:InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            widget.toggleView();
          },
          ),
        title: Text("Register Now"),
        centerTitle:true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 50),
        child: Center(
          child: Container(
            width: size.width*0.9,
            height:size.height* 0.5,
            child: Form(
              key: _formKey,

              child: Column(
                children: <Widget>[
                  Text("REGISTER FRESH", style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w600),),
                  SizedBox(height: 50,),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? "Enter email" : null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Enter Email",
                      labelText: "Email"
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
                        dynamic result = await _auth.registerWithEmailPassword(email.trim(), password.trim());
                        if(result == null){
                          setState(() {
                            Isanimation = false;
                            isLoading = false;
                            error = "Enter valid email";
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
                        color: BtnColor,
                        
                        borderRadius: BorderRadius.circular(Isanimation ? 20 : 8)
            
                      ),
                      alignment: Alignment.center,
                      child: Isanimation ? Icon(Icons.done) : Text("REGISTER",
                        style: TextStyle(
                          fontSize: 15,
                          color: FontColor,
                          letterSpacing: 0
                        ),),
            
                    ),
                  ),
                  SizedBox(height: 50,),
                  InkWell(
                    child: Text("ALREADY HAVE AN ACCOUNT? SIGN IN ",
                    style: TextStyle(letterSpacing: 0, fontSize:15,)),
                    onTap: (){
                      widget.toggleView();
                      
                    },
                    ),
                  SizedBox(height: 30,),
                  Text(error),
            
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}