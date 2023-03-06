import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class InkonzoFirebaseUser {
  InkonzoFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

InkonzoFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<InkonzoFirebaseUser> inkonzoFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<InkonzoFirebaseUser>(
      (user) {
        currentUser = InkonzoFirebaseUser(user);
        return currentUser!;
      },
    );
