import 'package:dutch_game/models/user_list.dart';
import 'package:dutch_game/screens/app_bars.dart';
import 'package:dutch_game/screens/board/mainDeck.dart';
import 'package:dutch_game/screens/board/playerDeck.dart';
import 'package:flutter/material.dart';
import 'package:dutch_game/services/auth.dart';
import 'package:dutch_game/screens/home/home.dart';


class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  double cardWidth;
  double cardHeight;
  double cardMarginVerital;
  double cardMarginHorizont;


  final AuthServices _auth = AuthServices();


  @override
  Widget build(BuildContext context) {
    cardWidth = MediaQuery.of(context).size.width * 0.15;
    cardHeight = MediaQuery.of(context).size.height * 0.10;
    cardMarginVerital = MediaQuery.of(context).size.width * 0.01;
    cardMarginHorizont = MediaQuery.of(context).size.height * 0.01;

    return MaterialApp(
      title: "DutchGame",
    
      home: Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: TopAppBar().build(context),
        endDrawer: DrawerRight(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: UserListState())
            // PlayerDeck(pos: Alignment.topCenter),
            // MainDeck(),
            // PlayerDeck(pos: Alignment.bottomCenter),
          ],
        ),
      )
      );
  }
}
