
import 'package:admin/authentication/authService.dart';
import 'package:admin/main.dart';
import 'package:admin/screens/analytics.dart';
import 'package:admin/screens/manage.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  Authentication _auth = Authentication();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Image(image: AssetImage("assets/dhaka.png"),),
          ),
          DrawerTab(icon: Icon(Icons.dashboard_outlined),titleName: "DASHBOARD", link:Admin() ),
          DrawerTab(icon: Icon(Icons.shopping_bag_outlined),titleName: "PRODUCTS", link:ManageBoard()),
          DrawerTab(icon: Icon(Icons.person_outline_outlined),titleName: "CUSTOMERS", link:Analytics()) ,
          DrawerTab(icon: Icon(Icons.shopping_cart_outlined),titleName: "ORDERS", link: Analytics() ),
          InkWell(
            splashColor: Colors.grey,
            onTap: () async{
              await _auth.signOut();
              
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("LOGOUT"),
                ),
              ),
            ),
          ),
          
          
          
        ],
      ),
    );
  }
}

class DrawerTab extends StatelessWidget {
  final String titleName;
  final Icon icon;
  final Widget link;
  const DrawerTab({
    Key? key,
    required this.titleName,
    required this.icon,required this.link
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context) => link));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListTile(
            leading:icon,
            title: Text(titleName),
          ),
        ),
      ),
    );
  }
}