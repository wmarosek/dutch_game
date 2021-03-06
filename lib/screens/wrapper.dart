import 'package:dutch_game/screens/board/board.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dutch_game/models/user.dart';
import 'package:dutch_game/screens/authenticate/authenticate.dart';
import 'package:dutch_game/screens/home/home.dart';
import 'package:dutch_game/screens/authenticate/sign_in.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return eitjer Home or Auth widgetr
    if(user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}