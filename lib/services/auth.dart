import 'package:dutch_game/utils/user_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dutch_game/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {

  FirebaseAuth _auth;
  GoogleSignIn _googleSignIn;

  AuthServices(){
    _auth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
  }

  //  sign in with google
  Future signInWithGoogle() async {
    try{
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final AuthResult authResult = await _auth.signInWithCredential(credential);
      FirebaseUser user = authResult.user;
      print("signed in " + user.displayName);

      return _proccesAuthUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
    
  }


  //  Sign in with email
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _proccesAuthUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


//  Register with username, email and password
  Future signUpWithEmailAndPassword(String username, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      UserUpdateInfo updateInfo = new UserUpdateInfo();
      updateInfo.displayName = username;
      await user.updateProfile(updateInfo);
      return signInWithEmailAndPassword(email, password);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //  sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }





  Future<User> _proccesAuthUser(FirebaseUser authUser) async {
    
  User loggedInUser = User(
    uid: authUser.uid,
    name: authUser.displayName,
    email: authUser.email,
    photoUrl: authUser.photoUrl,
  );
 
    String fcmToken = await _getTokenFromPreference();
    loggedInUser = loggedInUser.copyWith(fcmToken: fcmToken);
    await _addUserToFireStore(loggedInUser);
    await addUserTokenToStore(loggedInUser.uid, fcmToken);
    return loggedInUser;

  } 

  Future<Null> _addUserToFireStore(User user) async {

    await Firestore.instance
        .collection('users')
        .document(user.uid)
        .setData({'email': user.email, 'displayName': user.name, 'fcmToken': user.fcmToken, 'currentState': UserUtil().getStringFromState(UserState.available)});
  }

  saveUserFcmTokenToPreference(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.toString());
    await prefs.setString('fcm_token', token);
  }

  addUserTokenToStore(String userId, String fcmToken) async{
      await Firestore.instance
        .collection('users')
        .document(userId)
        .setData({'fcmToken': fcmToken}, merge: true);
  }



  Future<String> _getTokenFromPreference() async{ 
       SharedPreferences prefs = await SharedPreferences.getInstance();
       String fcmToken = prefs.getString('fcm_token');
       return fcmToken;
  }



  Future<User> getCurrentUser() async {

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = prefs.getString('fcm_token');
        FirebaseUser currentUser = await _auth.currentUser();
        if(currentUser != null){
          return User(uid: currentUser.uid, name: currentUser.displayName, photoUrl: currentUser.photoUrl , fcmToken:  token );
        }
        return null;
  }

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  } 
  
  Stream<User> get user { 
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  } 

  checkUserPresence(){
      FirebaseDatabase.instance
      .reference()
      .child('.info/connected')
      .onValue.listen((Event event) async{
        if(event.snapshot.value == false){
          return;
        }
          User currentUser = await getCurrentUser();
          FirebaseDatabase.instance.reference().child('/status/'+currentUser.uid).onDisconnect().set({
            'state': UserUtil().getStringFromState(UserState.offline)
          }).then((onValue){
              FirebaseDatabase.instance.reference().child('/status/'+currentUser.uid).set({
                'state': UserUtil().getStringFromState(UserState.available)
              });
          });
      });


  }
}