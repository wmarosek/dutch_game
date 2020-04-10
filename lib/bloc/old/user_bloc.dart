

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dutch_game/bloc/bloc_provider.dart';
// import 'package:dutch_game/models/user.dart';
// import 'package:dutch_game/services/auth.dart';
// import 'package:dutch_game/utils/user_utils.dart';
// import 'package:rxdart/rxdart.dart';

// class UserBloc extends BlocBase{
  
//   final AuthServices authServices;

//   final _currentUserSubject = BehaviorSubject<User>();
//   final _userListSubject = BehaviorSubject<List<User>>();
//   final _getUsersSubject = BehaviorSubject<Null>();
//   final _changeFcmTokenSubject = BehaviorSubject<Null>();
//   final _logoutUserSubject = BehaviorSubject<Null>();

//   Stream<User> get currentUser => _currentUserSubject.stream;
//   Stream<List<User>> get userList => _userListSubject.stream;

//   Function() get getUsers => () => _getUsersSubject.sink.add(null);
//   Function(User) get changeCurrentUser => (user) => _currentUserSubject.sink.add(user);
//   Function(String) get changeFcmToken => (fcmToken) => _changeFcmTokenSubject.sink.add(fcmToken);
//   Function() get logoutUser => () => _logoutUserSubject.sink.add(null);


//   UserBloc(this.authServices){
//     authServices.getCurrentUser().then((user){
//       if(user != null){
//         _currentUserSubject.sink.add(user);
//       }

//       _getUsersSubject.stream.listen(_handleGetUsers);
//       _changeFcmTokenSubject.listen(_handleChangeFcmToken);
//       _logoutUserSubject.listen(_handleLogout);
//     });
//   }


//   _handleGetUsers(_) async {
//     User currentUser = await authServices.getCurrentUser();
//     Firestore.instance.collection('users').snapshots().listen((data){
//       List<User> userList = data.documents.map<User>((userSnapshot) => User(
//           uid: userSnapshot.documentID,
//           name: userSnapshot['displayName'],
//           email: null,
//           photoUrl: null,
//           currentState: UserUtil().getStateFromString(userSnapshot['currentState']),
//           fcmToken: userSnapshot['fcmToken'],
//         )
//       ).toList();

//       if(currentUser != null){
//         userList = userList.where((user) => user.uid != currentUser.uid).toList();
//       }

//       _userListSubject.sink.add(userList);
//     });
//   }



//   _handleChangeFcmToken(fcmToken) async {
//     User currentUser = await authServices.getCurrentUser();
    
//     if(currentUser != null){
//       currentUser = currentUser.copyWith(fcmToken: fcmToken);
//       _currentUserSubject.sink.add(currentUser);
//       authServices.addUserTokenToStore(currentUser.uid, fcmToken);
//     }
//     authServices.saveUserFcmTokenToPreference(fcmToken);

//   }


//   _handleLogout(_){
//     authServices.signOut();
//     _currentUserSubject.sink.add(null);
//   }

//   @override
//   void dispose() {
//     _currentUserSubject.close();
//     _userListSubject.close();
//     _getUsersSubject.close();
//     _changeFcmTokenSubject.close();
//     _logoutUserSubject.close();
//   }

// }