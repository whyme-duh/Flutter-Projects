import 'package:flutter/material.dart';
import 'package:loginscreen/shared/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:loadingColor,
      child: Center(
        child: SpinKitDualRing(
          color: Colors.blue,
          size: 50,
        ),
      ),
    );
  }
}