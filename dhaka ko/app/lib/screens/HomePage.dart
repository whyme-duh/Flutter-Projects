import 'package:app/authentication/authService.dart';
import 'package:app/products/products.dart';
import 'package:app/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'NavBar/drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  
  final AuthenticationService _auth = AuthenticationService();

  bool favClick = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('DHAKA    KO',style: GoogleFonts.galindo(textStyle:TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              letterSpacing: 2
            ))),
        actions: [
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap : () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => MyCart()));
                },
                child: Icon(Icons.shopping_cart)),
            )
          ],
        ),
        ]
      ),
      body: Products()
    
      
      
    );
  }
}

