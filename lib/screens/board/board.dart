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
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton(
                child: Text(
                  'exit game',
                  style: TextStyle(fontSize: 10),
                ),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
                  );
                },
              )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PlayerDeck(pos: Alignment.topCenter),
            MainDeck(),
            PlayerDeck(pos: Alignment.bottomCenter),
          ],
        ),
      )
      );
  }
}
