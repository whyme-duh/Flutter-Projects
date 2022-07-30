import 'package:admin/navigation/appbar.dart';
import 'package:admin/screens/manage.dart';
import 'package:admin/shared/constants.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';

class Analytics extends StatefulWidget {
  const Analytics({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Analytics> {
  

  final List<Feature> features = [
    Feature(title: "Top Salees",
    color: Colors.blue,
    data: [0.1, 0.2, 0.5, 0.4, 0.2, 0.6, 0.7, 0.8, 0.2])
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Appbar(appBar: AppBar(), title: "DASHBOARD",),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.1,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(" TOP SALES", style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w800
                ),),
                // Text(" Nrs. 24000", style: TextStyle(
                //   fontSize: 15,
                //   letterSpacing: 2,
                //   fontWeight: FontWeight.w300
                // ),),
              ],
            ),
          ),
        
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: LineGraph(features: features, 
            size: Size(600, 450),
            
            labelX: ["Jan" ," Feb", "Mar", 'Apr', 'May', "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"],
            labelY: ["10", "20", "30", "40"," 50", "60"],
            showDescription: false,
            graphColor: Colors.black,
            ),
        )
        ],
      )
      
      
    );
  }
}