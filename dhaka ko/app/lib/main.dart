import 'package:app/authentication/authService.dart';
import 'package:app/products/products.dart';
import 'package:app/products/singleProductDetail.dart';
import 'package:app/screens/HomePage.dart';
import 'package:app/authentication/signIn.dart';
import 'package:app/screens/cart.dart';
import 'package:app/screens/favourites.dart';
import 'package:app/user/user.dart';
import 'package:app/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DhakaKo());
}

class DhakaKo extends StatefulWidget {
  const DhakaKo({ Key? key }) : super(key: key);

  @override
  _DhakaKoState createState() => _DhakaKoState();
}

class _DhakaKoState extends State<DhakaKo> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserProfile?>.value(
      initialData: null,
      catchError: (_, __)=> null,
      value: AuthenticationService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.white),
        initialRoute: '/wrapper',
        routes: {
          "/wrapper" :(context) => Wrapper(),
          "/productDetail" :(context) => ProductDetail(),
          '/favourite' : (context) => Favourite(),
          "/mycart" : (context) => MyCart()
        },
        
      ),
    );
  }
}