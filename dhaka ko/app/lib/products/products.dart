import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Products extends StatefulWidget {
  const Products({ Key? key }) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final List product_list = [
    {
      "name" : "Dhaka Brocode",
      "picture" : "assets/pics/mask.jpg",
      "price" : 350,
      "old_price" : 400,
      "description" : "The Dhaka Prodcut Mask is the nepali style mask embroided with the clothing materail of dhaka (topi ) "
    } ,
    {
      "name" : "Dhaka Brocode 2",
      "picture" : "assets/pics/mask.jpg",
      "price" : 450,
      "old_price" : 400,
      "description" : "The Dhaka Prodcut Mask is the nepali style mask embroided with the clothing materail of dhaka (topi ) "
    },
    {
      "name" : "Dhaka Brocode 2",
      "picture" : "assets/pics/mask.jpg",
      "price" : 550,
      "old_price" : 400,
      "description" : " "
    } 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
            mainAxisSpacing: 5,
            childAspectRatio: 5/4.5,
          ), 
          itemCount: product_list.length,
          itemBuilder: (BuildContext context, index){
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/productDetail', arguments: {
                  'name' : product_list[index]['name'],
                  'old_price' : product_list[index]['old_price'], 
                  'price' :product_list[index]['price'],
                  'img' : product_list[index]['picture'],
                  'descriptions' : product_list[index]['description'],
                });

              },
              child: SingleProd(
                prod_name: product_list[index]['name'], 
                prod_img:  product_list[index]['picture'], 
                prod_old_price:  product_list[index]['old_price'] ,
                prod_price: product_list[index]['price']),
            );
        }
      ),
    );    
  }
}

class SingleProd extends StatefulWidget {
  final prod_name;
  final prod_img;
  final prod_price;
  final prod_old_price;
  const SingleProd({ Key? key, required this.prod_name, required this.prod_img, required this.prod_price, required this.prod_old_price }) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<SingleProd> {
  bool favClick = false;
  @override
  Widget build(BuildContext context) {
    var size=  MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical:10, horizontal:20),
      child: Container(
        alignment: Alignment.center,
        width: size.width*0.9,
        height: size.height* 0.50,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image(image: AssetImage(widget.prod_img)),
            ),
            Text(widget.prod_name,
              style: GoogleFonts.lato(textStyle:TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                letterSpacing: 2
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      
                      setState(() {
                        favClick = !favClick ;
                      });
                    },
                    child: favClick ? Icon(Icons.favorite) :Icon(Icons.favorite_border_rounded)),
                  Text("\NRs ${widget.prod_price}", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                  Icon(Icons.shopping_bag)
                ],),
            )
          ],
        ),
      ),
    );
  }
}