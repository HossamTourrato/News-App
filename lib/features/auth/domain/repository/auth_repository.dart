import '../entities/auth.dart';

abstract class AuthRepository {
  Future<AuthEntity?> signInWithGoogle();
  Future<AuthEntity?> signInWithEmail(String email, String password);
  Future<void> signOut();
}
