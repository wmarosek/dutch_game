import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dutch_game/models/user.dart';
import 'package:dutch_game/screens/authenticate/authenticate.dart';
import 'package:dutch_game/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
       
    // return eitjer Home or Auth widget
    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}