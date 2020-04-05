import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dutch_game/models/user.dart';
import 'package:dutch_game/utils/user_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserListState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection("users").snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.80,
            child: ListView.builder(
                physics: PageScrollPhysics(), // in ListView
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                padding: const EdgeInsets.only(top: 5.0),
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.documents[index];
                  if(ds["currentState"].toString() == UserUtil().getStringFromState(UserState.available)){
                    return Row(
                    children: <Widget>[
                      Flexible(
                        child: Card(
                            child: ListTile(
                              title: Text(ds["email"].toString()),
                              subtitle: Text(ds["currentState"].toString()),
                            ),
                        ),
                      ),
                    ],
                  );
                  }
                }
            )
          );
        }
      },
    );
  }
}
