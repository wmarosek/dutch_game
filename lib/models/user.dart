enum UserState { available, playing, away, offline }

class User{

  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final UserState currentState;
  final String fcmToken;

  User(
      {this.uid,
      this.name,
      this.email,
      this.photoUrl,
      this.currentState,
      this.fcmToken});

  User copyWith({
    String id,
    String name,
    String email,
    String avatarUrl,
    UserState currentState,
    String fcmToken,
  }) {

    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: avatarUrl ?? this.photoUrl,
      currentState: currentState ?? this.currentState,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}