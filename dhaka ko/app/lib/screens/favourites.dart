import 'package:app/screens/NavBar/appbar.dart';
import 'package:app/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Favourite extends StatefulWidget {
  const Favourite({ Key? key }) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {

  List favProducts = [
    {
      "name" : "df",

    },
    {
      'name' : 'dsaf'
    }
  ];
  int quantity = 1;
  final int num = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Appbar(appBar: AppBar(),title: "MERO WISHLIST",icon: Icon(Icons.shopping_cart),pageRoute: "mycart",),
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
                                  child: IconButton(
                                    splashRadius: 0.5,

                                    onPressed: () {},
                                    icon: Icon(Icons.add_shopping_cart)),
                                )
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

        })
      
    );
  }
}
