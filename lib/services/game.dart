import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Game extends StatefulWidget {
  Game({Key key, this.type, this.me, this.gameId, this.withId}) : super(key: key);
  
  final String type, me, gameId, withId;  
  
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  BuildContext _context;
  List<List<String>> field = [
    [
      '','','','','',''
    ],
    [
      '','','','','',''
    ]
  ];

  bool playerTurn = true;
  final String type, me, gameId, withId;  

  _GameState({this.type, this.me, this.gameId, this.withId});


  @override
  void initState(){
    super.initState();
    if (me != null) {
      playerTurn = me == 'X'; 
    }

    FirebaseDatabase.instance.reference().child('games').onChildAdded.listen(
      (Event event) {
        String key = event.snapshot.key;
        if(key != 'restart'){
          
        }

      }
    );


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      
    );
  }
}