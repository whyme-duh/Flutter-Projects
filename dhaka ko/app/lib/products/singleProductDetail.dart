import 'package:app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({ Key? key }) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  
  Map fromProducts = {};
  @override
  Widget build(BuildContext context) {
    fromProducts = ModalRoute.of(context)!.settings.arguments as Map;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image(image: AssetImage('assets/dhaka.png'),width: size.width * 0.15, height: size.height * 0.15,),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[200],
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.shopping_cart)
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.09,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text("\NRs. ${fromProducts['price']}",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500
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
                      "ADD TO CART", style: GoogleFonts.acme(
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight:FontWeight.w800,
                          letterSpacing:2
                        )
                      ),
                    ),SizedBox(width: 20,),
                    Icon(Icons.add_shopping_cart)
                  ],
                ),
              )
            )
          ],
        ),
      ),
      body: SingleProductDetail(
        prod_name: fromProducts['name'], 
        prod_img:  fromProducts['img'], 
        prod_old_price:  fromProducts['old_price'],
        prod_price:fromProducts['price'],
        prod_description: fromProducts['descriptions']),
    );
  }
}
class SingleProductDetail extends StatefulWidget {
  final prod_name;
  final prod_img;
  final prod_price;
  final prod_old_price;
  final prod_description;
  const SingleProductDetail({ Key? key, required this.prod_name, required this.prod_img, required this.prod_price, required this.prod_old_price, this.prod_description }) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<SingleProductDetail> {
  int quantity = 1;
  bool favClick = false;
  @override
  Widget build(BuildContext context) {
    var size=  MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height:  size.height * 0.20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
            color:BgColor,

          ),
        ),
        Center(
          child: Container(
            width: size.width * 0.90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: AssetImage(widget.prod_img),
                    width: size.width ,
                    )),
                ),
                SizedBox(height: size.height * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.prod_name,
                      style: GoogleFonts.lato(textStyle:TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      )),
                    ),
                    Row(
                      children: [
                        Text(
                          "5",style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w400
                          ),
                        ),
                        Icon(Icons.star_border)
                      ]
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.05,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "About Product",
                    style:GoogleFonts.lato(textStyle:TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        fontWeight: FontWeight.w800
                      )), 
                  ),
                ),
                SizedBox(height: size.height * 0.05,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.prod_description,
                    style:GoogleFonts.abel(textStyle:TextStyle(
                        fontSize: 20 ,
                        fontWeight: FontWeight.w300
                      )), 
                  ),
                ),
                SizedBox(height: size.height * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Quantity : ",
                        style:GoogleFonts.lato(textStyle:TextStyle(
                            letterSpacing: 2,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          )
                        ), 
                      ),
                    ),
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
                ),

              ],
            ),
          ),
        )
      ],
    );
  }
}