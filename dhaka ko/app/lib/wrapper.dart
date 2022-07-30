import 'package:app/screens/HomePage.dart';
import 'package:app/user/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/Authenticate.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProfile?>(context);


    return user == null ? Authenticate() : HomePage();
  }
}