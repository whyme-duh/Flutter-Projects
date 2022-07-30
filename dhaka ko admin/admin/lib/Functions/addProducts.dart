import 'package:admin/navigation/appbar.dart';
import 'package:flutter/material.dart';


class AddProducts extends StatefulWidget {
  const AddProducts({ Key? key }) : super(key: key);

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Appbar(appBar: AppBar(), title: "ADD PRODUCTS",),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          width:size.width * 0.9 ,
          height: size.height * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text("PRODUCT NAME :", style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500
                  
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  hintText: "PRODUCT NAME"
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("DESCRIPTIONS :", style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500
                  
                  ),),
              ),
              TextFormField(
                decoration: InputDecoration(
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  hintText: "PRODUCT DESCRIPTIONS",
                ),
                maxLines: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 170,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("CURRENT PRICE :", style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w500
                            
                            ),),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              
                            ),
                          ),
                          maxLines: 1,
                          
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("OLD PRICE :", style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w500
                            
                            ),),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              
                            ),
                          ),
                          maxLines: 1,
                          
                        ),
                      ],
                    ),
                  ),
                ],
              )
              ,Align(
                alignment: Alignment.centerLeft,
                child: Text("ATTACH IMAGE :", style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500
                  
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}

