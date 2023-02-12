import 'package:firebase1_3/model/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<UserCredential> login(UserModel user) async {
    final UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: user.username,
      password: user.password,
    );
    return credential;
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
