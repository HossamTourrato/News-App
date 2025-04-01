import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/auth.dart';

abstract class AuthRemoteDataSource {
  Future<AuthEntity?> signInWithGoogle();
  Future<AuthEntity?> signInWithEmail(String email, String password);
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth auth;

  AuthRemoteDataSourceImpl(this.auth);

  @override
  Future<AuthEntity?> signInWithGoogle() async {
    final GoogleAuthProvider googleProvider = GoogleAuthProvider();
    final UserCredential userCredential = await auth.signInWithPopup(googleProvider);
    final user = userCredential.user;

    if (user != null) {
      return AuthEntity(uid: user.uid, email: user.email);
    }
    return null;
  }

  @override
  Future<AuthEntity?> signInWithEmail(String email, String password) async {
    final UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user;
    if (user != null) {
      return AuthEntity(uid: user.uid, email: user.email);
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}