import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dutch_game/main.dart';
import 'package:dutch_game/screens/app_bars.dart';
import 'package:dutch_game/screens/app_bars.dart';
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
    super.initState();
    _saveDeviceToken(); // To store token to firestore.
  }

  _saveDeviceToken() async {
    String fcmToken = await _fcm.getToken();
    if (fcmToken != null) {
      _auth.saveUserFcmTokenToPreference(fcmToken);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: TopAppBar().build(context),
      bottomNavigationBar: BottomAppBarSignIn().build(context),
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
      endDrawer: DrawerRight().build(context),
    );
  }
}
