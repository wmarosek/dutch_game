import 'package:flutter/material.dart';
import 'package:dutch_game/services/auth.dart';


class Home extends StatelessWidget {

  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('The Dutch Game'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.sighOut();
            }
            )
        ],
        ),
    );
  }
}