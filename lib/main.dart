import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dutch_game/screens/wrapper.dart';
import 'package:dutch_game/services/auth.dart';
import 'package:dutch_game/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServices().user,
      child: MaterialApp(
        theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
        home: Wrapper(),
      ),
    );
  }
}
