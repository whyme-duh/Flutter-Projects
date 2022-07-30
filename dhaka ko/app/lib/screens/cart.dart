import 'package:app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'NavBar/appbar.dart';


class MyCart extends StatefulWidget {
  const MyCart({ Key? key }) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List favProducts = [
    {
      "name" : "df",

    },
    {
      'name' : 'dsaf'
    }
  ];
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Appbar(appBar: AppBar(),title: "MERO CART", icon: Icon(Icons.shopping_bag),pageRoute:"favourite" ,),
      bottomNavigationBar: Container(
        height: size.height * 0.09,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text("\NRs. 500",style: TextStyle(
                            fontSize: 25,fontWeight: FontWeight.w500
                ),
              ),
            ),
            Container(
              alignment:Alignment.center,
              width: size.width * 0.55,
              height: size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
                color:BgColor,
              ),
              child:InkWell(
                onTap: () {
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CHECKOUT", style: GoogleFonts.acme(
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight:FontWeight.w800,
                          letterSpacing:2
                        )
                      ),
                    ),SizedBox(width: 20,),
                    Icon(Icons.shopping_cart_rounded)
                  ],
                ),
              )
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: favProducts.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal:10),
            child: Container(
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(image: AssetImage('assets/pics/mask.jpg'), width: size.width * 0.45,)),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:  10),
                              child: Text("DHAKA KO BROCODE", style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize:15,fontWeight : FontWeight.bold)
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),

                            Text("Nrs. 300", style: GoogleFonts.lato(
                              textStyle: TextStyle(fontSize:15)
                              ),
                            ),
                            SizedBox(height: 20,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  splashRadius: 0.5,
                                  onPressed: () {}, icon: Icon(Icons.delete)),
                                Padding(
                                  padding: EdgeInsets.only(right:10),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (quantity == 1) {
                                              quantity = 1;
                                            }
                                            else{
                                              quantity -= 1;
                                            }
                                          });
                                      }, 
                                      icon: Icon(Icons.remove_circle_outline)
                                      ),
                                      Text('$quantity', style: TextStyle(fontSize: 20),),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity += 1;
                                          });

                                      }, 
                                      icon: Icon(Icons.add_circle_outline)
                                      ),

                                      
                                    ],
                                  )
                                ),
                              ],
                            )
                          ],
                          
                        ),
                      ),
                      
                    ],
                  ),
                ),

            ),
          );

        }),

    );
  }
}