import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate{

  final List subjects = [
      "IIT",
      "C PROGRAMMING",
      'STATS',
      'MATHS 1',
      'MATHS 2',
      "DIGITAL LOGICS",
      "MICROPROCCESOR"
    ];

  
  @override
  ThemeData appBarTheme(BuildContext context){
    final ThemeData theme  = Theme.of(context);
    return theme;
  }

  // clearing the item written in the search bar
  @override
  List <Widget> buildActions(BuildContext context){
    return [
      IconButton(onPressed: () {
        query = '';   // query is the textfield where the search item are placed, here it is used to clear the written words
      }, 
      icon: Icon(Icons.clear))
    ];

  }
  // used for going back
  @override
  Widget buildLeading(BuildContext context){
    return IconButton(onPressed: () {
        close(context, null);
      }, 
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress:transitionAnimation
    ));
  }
  // this build will show the result of the searched item
  @override
  Widget buildResults(BuildContext context){
    final result = subjects.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(result[index]),
        );
      });
  }


  // this returns the suggestions written in the search bar
  @override
  Widget buildSuggestions(BuildContext context){
    var size = MediaQuery.of(context).size;

    final suggestionList = query.isEmpty ? subjects : subjects.where((element) => element.startsWith(query.toUpperCase())).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder:(context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: Card(
            elevation: 2,
            color: FileColor,
            child: ListTile(
              onTap: () {
                if (suggestionList[index] =="IIT"){
                  Navigator.pushNamed(context, "/allfiles");
                }
                else if(suggestionList[index] =="C PROGRAMMING"){
                  print("DONE");
                }
              },
              leading: Icon(Icons.book_rounded),
              // here rich text is used to show the user visibility of the written words
              title: RichText(
                text: TextSpan(
                  text:suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                    color: LetterColor, 
                    fontWeight: FontWeight.bold
                  ),
                  children:[
                    TextSpan(
                      text:suggestionList[index].substring(query.length),
                      style: TextStyle(
                        color:FontColor
                      )
                    )
                  ]
                ),
              ),
            ),
          ),
        );
      } ,
    );
  }
}

