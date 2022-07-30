
import 'package:admin/screens/homepage.dart';
import 'package:admin/user/user.dart';
import 'package:flutter/material.dart';

import 'Auth.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProfile?>(context);


    return user == null ? Auth() : HomePage();
  }
}