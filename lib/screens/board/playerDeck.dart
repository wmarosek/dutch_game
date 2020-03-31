import 'package:dutch_game/screens/board/card.dart';
import 'package:flutter/material.dart';


class PlayerDeck extends StatelessWidget {
  PlayerDeck({this.pos});

  final Alignment pos;


  @override
  Widget build(BuildContext context) {
    
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01) ,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01, bottom: MediaQuery.of(context).size.height * 0.01),
      height: 200.0,
  //    color: Colors.green[50],
      child: Align(
        alignment: pos,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CardGame(amount: 7, color: Colors.red[400]),
            CardGame(amount: 7, color: Colors.red[400]),
            CardGame(amount: 9, color: Colors.black54),
            CardGame(amount: 7, color: Colors.red[400]),                 
          ],
        )
      ),
      ),
    );
  }
}