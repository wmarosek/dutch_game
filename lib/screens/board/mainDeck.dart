import 'package:dutch_game/screens/board/card.dart';
import 'package:flutter/material.dart';


class MainDeck extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01) ,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05, bottom: MediaQuery.of(context).size.height * 0.05),
      height: 200.0,
    //  color: Colors.green[100],
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Container(
                child: Column(
                  children: <Widget>[
                    CardGame(amount: 7,color: Colors.red[400]),
                    Text(
                      'Current card'
                    )
                  ]
                )
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                child: Column(
                  children: <Widget>[
                    CardGame(amount: 7,color: Colors.black54),
                    Text(
                      'Deck'
                    )
                  ]
                )
              ),
            ),
            
          // [
          //   Expanded(
          //     child: Row(
          //       children: <Widget>[
          //         Flexible(
          //           flex: 4,
          //           child: Container(
          //             child: Column(
          //               children: <Widget>[
          //                 CardGame(amount: 7,color: Colors.white24),
          //                 Text(
          //                   'Current card',
          //                   style: new TextStyle(
          //                       fontSize: 12.0,
          //                       fontFamily: 'Roboto',
          //                       color: Colors.grey,
          //                   )
          //                 ),
          //               ],
          //             ),
          //           )
          //         ),
          //         Flexible(
          //           flex: 2,
          //           child: Container(
          //             child: Column(
          //               children: <Widget>[
          //                 CardGame(amount: 7,color: Colors.white24),
          //                 Text(
          //                   'Deck',
          //                   style: new TextStyle(
          //                       fontSize: 12.0,
          //                       fontFamily: 'Roboto',
          //                       color: Colors.grey,
          //                   )
          //                 ),
          //               ],
          //             ),
          //           )
                  
                
              
          
          ]
        )
      ),
      ),
    );
  }
}