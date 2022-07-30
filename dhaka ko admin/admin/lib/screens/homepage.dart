import 'package:admin/navigation/drawer.dart';
import 'package:admin/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'analytics.dart';
import 'manage.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    
  }) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List menu = [
    {
      "title" : "ANALYTICS",
      "icon" : Icons.analytics_outlined,
      "link" : Analytics()
    },
    {
      "title" : "PRODUCTS",
      "icon" : Icons.shopping_bag_outlined,
      "link" :ManageBoard()
    },
    {
      "title" : "CUSTOMERS",
      "icon" : Icons.person_outline_outlined,
      "link" :""
    },
    {
      "title" : "ORDERS",
      "icon" : Icons.shopping_cart_outlined,
      "link" :""
    },
  ];
  
  Map<String, double> dataMap = {
    "Sold" : 3,
    "In-Stock" : 5,
    "Returned" : 2,
    "Gifted" : 1
  };
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.dashboard_outlined),
              SizedBox(width: 5,),
              Text("DASHBOARD", style: TextStyle(
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.w800

              ),),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: SideDrawer(),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: <Widget>[
         
          
          Expanded(
            child: Padding(
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
                      },
                      child: Positioned(
                        top: 20,
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
                      ),
                    );
                  },
                  ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.analytics_outlined),
                    SizedBox(width: 5,),
                    Text("PRODUCTS ANALYTICS", style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w800
                
                    ),),
                  ],
                ),
                SizedBox(height: 50,),
                PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(seconds: 2),
                  chartLegendSpacing: 32,
                  chartRadius: 200,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 20,
                  legendOptions: LegendOptions(
                    showLegends: true,
                    legendPosition: LegendPosition.right,
                    showLegendsInRow: false
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValuesInPercentage: true
                  ),
                ),
              ],
            ),
          ),
          
          
        ],
      ),
    );
  }
}