
import '../entities/auth.dart';
import '../repository/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  Future<AuthEntity?> call() async {
    return await repository.signInWithGoogle();
  }
}


class SignInWithEmail {
  final AuthRepository repository;

  SignInWithEmail(this.repository);

  Future<AuthEntity?> call(String email, String password) async {
    return await repository.signInWithEmail(email, password);
  }
}


class SignOut {
  final AuthRepository repository;

  SignOut(this.repository);

  Future<void> call() async {
    return await repository.signOut();
  }
}