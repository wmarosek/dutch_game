import 'package:dutch_game/main.dart';
import 'package:dutch_game/screens/authenticate/register.dart';
import 'package:dutch_game/screens/authenticate/sign_in.dart';
import 'package:dutch_game/services/auth.dart';
import 'package:flutter/material.dart';


class TopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('The Dutch Game'),
    );
  }
}

class TopAppBarRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('The Dutch Game'),
      actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white),
            label: Text('Sign in', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
    );
  }
}




class TopAppBarSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('The Dutch Game'),
      actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white),
            label: Text('Register', style: TextStyle(color: Colors.white)),
            onPressed: () {
              SignIn().createState();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Register()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
    );
  }
}


class BottomAppBarSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.play_circle_outline, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}


class DrawerRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Drawer(
        child: Container(
          
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 2.0)),
                child: Text(
                  'Your profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.add_to_home_screen),
                title: Text(
                  'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                onTap: () async {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings_applications),
                title: Text(
                  'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'Log out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                onTap: () async {
                  await AuthServices().signOut();
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
      );
  }
}
