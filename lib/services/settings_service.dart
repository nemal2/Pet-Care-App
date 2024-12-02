import 'package:firebase_auth/firebase_auth.dart';

class SettingsService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    await _auth.signOut();
  }
}
