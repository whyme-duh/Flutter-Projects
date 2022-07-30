import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appBar;
  final String title;
  final Icon icon;
  final String pageRoute;
  const Appbar({ Key? key,required this.appBar,required this.title,required this.icon,required this.pageRoute }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AppBar(
        title: Text(title,
                style: GoogleFonts.galindo(
                  textStyle:TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    letterSpacing: 2
                  ))),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[200],
        elevation: 0,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/$pageRoute');
          }, icon: icon)
        ],
      );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}