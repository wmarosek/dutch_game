import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dutch_game/models/user.dart';
import 'package:dutch_game/utils/user_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  Future signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    return _proccesAuthUser(user);
  }

  Future signInWithCredentials(String email, String password) async {
    final AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseUser user = authResult.user;
    return _proccesAuthUser(user);

  }

  Future<void> signUp({String email, String password}) async {
    final AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseUser user = authResult.user;
    return _proccesAuthUser(user);
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }

 Future<User> _proccesAuthUser(FirebaseUser authUser) async {
      
    User loggedInUser = User(
      uid: authUser.uid,
      name: authUser.displayName,
      email: authUser.email,
      photoUrl: authUser.photoUrl,
    );
    
    await _addUserToFireStore(loggedInUser);
    return loggedInUser;

  }

  Future<Null> _addUserToFireStore(User user) async {

    await Firestore.instance
        .collection('users')
        .document(user.uid)
        .setData({'email': user.email, 'displayName': user.name, 'fcmToken': user.fcmToken, 'currentState': UserUtil().getStringFromState(UserState.available)});
  }
 

 






}
