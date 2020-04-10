
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayWithFriendsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      icon: Icon(FontAwesomeIcons.userFriends, color: Colors.white),
      onPressed: () {
        // Navigator.of(context).push(
        //                 MaterialPageRoute(builder: (index) => Board()));
      },
      label: Text('Play with Friends', style: TextStyle(color: Colors.white, )),
      color: Colors.blueAccent,
    );
  }
}


class PlayWithComputer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      icon: Icon(FontAwesomeIcons.gamepad, color: Colors.white),
      onPressed: () {
        // Navigator.of(context).push(
        //                 MaterialPageRoute(builder: (index) => Board()));
      },
      label: Text('Play with computer', style: TextStyle(color: Colors.white, )),
      color: Colors.blueGrey,
    );
  }
}