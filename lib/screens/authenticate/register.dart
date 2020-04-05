import 'package:dutch_game/main.dart';
import 'package:dutch_game/screens/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:dutch_game/services/auth.dart';
import 'package:dutch_game/shared/constants.dart';

class Register extends StatefulWidget {


  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}


  // text field state


class _RegisterState extends State<Register> {

  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String username = '';
  String password ='';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: TopAppBarRegister().build(context),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Username'),
                validator: (val) => val.isEmpty ? 'Enter an username' : null,
                onChanged: (val) {
                  setState(() => username = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white)
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()){
                    dynamic result  = await _auth.signUpWithEmailAndPassword(username, email, password);
                    if(result == null){
                      setState (() => error = 'please supply a valid email');
                    }
                    else{
                      Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (Route<dynamic> route) => false,
                      );
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0)
              ),
            ]
          ),
        ),
      ),
    );
  }
}