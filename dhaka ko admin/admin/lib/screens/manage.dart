
import 'package:admin/Database/categoryDb.dart';
import 'package:admin/Functions/addProducts.dart';
import 'package:admin/navigation/appbar.dart';
import 'package:admin/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'analytics.dart';


class ManageBoard extends StatefulWidget {
  const ManageBoard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<ManageBoard> {
  List menu = [
    {
      "title" : "ADD PRODUCTS",
      "icon" : Icons.add_shopping_cart_rounded,
      "link" : AddProducts()
    },
    {
      "title" : "SOLD PRODUCTS",
      "icon" : Icons.shopping_bag_outlined,
      "link" :ManageBoard()
    },
    {
      "title" : "DELELE PROD ",
      "icon" : Icons.delete_outlined,
      "link" :""
    },
    {
      "title" : "ORDERS",
      "icon" : Icons.shopping_cart_outlined,
      "link" :""
    },
    {
      "title" : "CATEGORY",
      "icon" : Icons.category_outlined,
      "link" :""
    },
  ];

  CategoryDb _categoryDb =  CategoryDb();
  TextEditingController categoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Appbar(appBar: AppBar(), title: "PRODUCTS",),
      body: Stack(
        children: [
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 290,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 5/4,),
                itemCount: menu.length,
                
                itemBuilder: (context, index){
                  return InkWell(
                    
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => menu[index]['link']));
                      // categoryAlert();
                    },
                    child: Container(
                      decoration:BoxDecoration(
                        color:gridColor,
                        
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(menu[index]["icon"]),
                            SizedBox(height: 10,),
                            Text(menu[index]["title"],style: TextStyle(
                              letterSpacing: 2,
                  
                            ),),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                ),
            ),
        )
        ],
      ),

      
    );
  }

  void categoryAlert() {
    var alert = AlertDialog(
      title: Text("ADD CATEGORY"),
      content: Form(
        key :_formKey,
        child: TextFormField(
          validator:(val) {
            if (val!.isEmpty){
              return "Category Cannot Be Empty";
            }
          },
          controller: categoryController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add Category"
          ),
        ),
        
      ),
      actions: <Widget>[
        TextButton.icon(onPressed: () {
          if(categoryController.text != null && _formKey.currentState!.validate() ){
            _categoryDb.createCategory(categoryController.text);
          }
          Fluttertoast.showToast(msg: "Category has been added");
          
        }, icon: Icon(Icons.add), label: Text("ADD"),),
        TextButton.icon(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.close), label: Text("CLOSE"),),


      ]
    );
    showDialog(context: context, builder: (context) => alert);
  }
}