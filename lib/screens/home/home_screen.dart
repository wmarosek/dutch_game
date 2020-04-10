import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dutch_game/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:dutch_game/screens/home/home_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomeScreen extends StatefulWidget {
  

  final String name;
  String fcm;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  Home createState() => Home();
}

class Home extends State<HomeScreen> {

  final FirebaseMessaging _fcm = FirebaseMessaging();
  final postUrl = 'https://fcm.googleapis.com/fcm/send';
  String key = 'AAAAasK5vlk:APA91bFmPhEKm6tKbQyqRCh6P6TMmQLGusTxcuJP6Kbp7A9_gFbgxreK4cfyoHeEIQP11DrKGs6Lq1LKLBZBvs3zACVxeGbvB2QPCzRn7BJMbAfSGPmFLb5MouxvE6-AcMWGqIeq_X2F';
  String _message = '';

  // UserBloc _userBloc;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //    _userBloc = BlocProvider.of<UserBloc>(context);
  // }


  // @override
  // void initState() {
  //   getMessage();

  //   super.initState();
  // }

  // void getMessage(){
  //   _fcm.configure(
  //       onMessage: (Map<String, dynamic> message) async {
  //     print('on message $message');
  //     setState(() => _message = message["notification"]["title"]);
  //   }, onResume: (Map<String, dynamic> message) async {
  //     print('on resume $message');
  //     setState(() => _message = message["notification"]["title"]);
  //   }, onLaunch: (Map<String, dynamic> message) async {
  //     print('on launch $message');
  //     setState(() => _message = message["notification"]["title"]);
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    //   appBar: TopAppBar().build(context),
    //   bottomNavigationBar: BottomAppBarSignIn().build(context),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text("Message: $_message"),
    //         RaisedButton(
    //           child: Text('START GAME'),
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => Board()),
    //             );
    //           },

    //         ),
    //       ],
    //     ), 
    //   ),
    //   endDrawer: DrawerRight().build(context),
    // );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 240.0,
                  ),
                  Text(
                    'The Dutch Game',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[100],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(child: Text('Current user : ' + widget.name+ '!'))
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        PlayWithComputer(),
                        PlayWithFriendsButton(),
                      ],
                    ),
                  ),

                  IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());}),
                  // StreamBuilder(
                  //   initialData: null,
                  //   stream: _userBloc.currentUser,
                  //   builder: (context, currentUserSnapshot) {
                  //     if (currentUserSnapshot.hasData &&
                  //         currentUserSnapshot.data != null) {
                  //       return FlatButton(
                  //         child: Text(
                  //           'Logout',
                  //           style: TextStyle(fontSize: 18.0, color: Colors.blue),
                  //         ),
                  //         onPressed: () {
                  //           _userBloc.logoutUser();
                  //         },
                  //       );
                  //     } else {
                  //       return Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: <Widget>[
                  //             Text(
                  //               'Play with Others?',
                  //               style: TextStyle(fontSize: 18.0),
                  //             ),
                  //             FlatButton(
                  //               child: Text(
                  //                 'Sign In',
                  //                 style: TextStyle(
                  //                     fontSize: 18.0, color: Colors.blue),
                  //               ),
                  //               onPressed: () {

                  //               },
                  //             )
                  //           ]);
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
