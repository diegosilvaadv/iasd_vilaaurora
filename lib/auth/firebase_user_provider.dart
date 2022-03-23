import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class IasdVilaAuroraFirebaseUser {
  IasdVilaAuroraFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

IasdVilaAuroraFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<IasdVilaAuroraFirebaseUser> iasdVilaAuroraFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<IasdVilaAuroraFirebaseUser>(
            (user) => currentUser = IasdVilaAuroraFirebaseUser(user));
