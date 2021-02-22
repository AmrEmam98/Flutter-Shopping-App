import 'package:firebase_auth/firebase_auth.dart';
import 'file:///C:/Users/Amr%20Emam/AndroidStudioProjects/online_shopping_store/lib/interfaces/auth_listner.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthListener listener;
  AuthService(this.listener);
  void doLogin(String email, String password) async {
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      listener.onSuccess();
    }).catchError((error) {
      listener.onFail();
    });
  }

  void doSignUp(String email, String password, String userName) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      listener.onSuccess();
    }).catchError((error) {
      listener.onFail();
    });
  }
}
