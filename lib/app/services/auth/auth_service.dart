import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserCredential> signInWithGoogle();

  Future<void> signOut();
}
