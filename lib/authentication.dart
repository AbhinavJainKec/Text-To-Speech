import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final _auth = FirebaseAuth.instance;

  String user;

  Future getLoginInfo() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        return user.isAnonymous;
      }
    } catch (e) {
      print(e);
    }
  }
}
