import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './auth_service.dart';

class AuthServiceImpl extends AuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final authentication = await googleSignInAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  Future<void> _googleSignOut() async {
    final google = GoogleSignIn();
    if (google.clientId == null) return;
    await google.disconnect();
  }

  Future<void> _fireBaseSignOut() async {
    if (_auth.currentUser == null) return;
    await _auth.signOut();
  }

  @override
  Future<void> signOut() async {
    await Future.wait([
      _googleSignOut(),
      _fireBaseSignOut(),
    ]);
  }
}
