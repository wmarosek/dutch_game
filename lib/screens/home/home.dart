import 'package:dutch_game/main.dart';
import 'package:flutter/material.dart';
import 'package:dutch_game/services/auth.dart';
import 'package:dutch_game/screens/board/board.dart';

class Home extends StatelessWidget {

  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[10],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('The Dutch Game'),
        elevation: 0.0,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('START GAME'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Board()),
            );
          },
        ),
      ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Text(
                'Your profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log out'),
              onTap: () async{
                await _auth.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}