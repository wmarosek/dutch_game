import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dutch_game/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:dutch_game/services/auth.dart';
import 'package:dutch_game/screens/board/board.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  const HomePage({Key key, this.user}) : super(key: key);
  @override
  Home createState() => Home();
}

class Home extends State<HomePage> {
  final AuthServices _auth = AuthServices();
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    _saveDeviceToken(); // To store token to firestore.
  }

  _saveDeviceToken() async {
    String fcmToken = await _fcm.getToken();
    if (fcmToken != null) {
      var token = Firestore.instance
          .collection('tokens')
          .document('key')
          .setData({'fcmToken': fcmToken}, merge: true);
      print(fcmToken);
      _auth.saveUserFcmTokenToPreference(fcmToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
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
        child: Container(
          color: Colors.grey[700],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey[900]),
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
                onTap: () async {
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
        )
      ),
    );
  }
}
