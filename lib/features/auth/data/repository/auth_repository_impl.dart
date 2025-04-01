import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/entities/auth.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRepositoryImpl(this.remoteDataSource,{required this.firebaseAuth,required this.googleSignIn});

  @override
  Future<AuthEntity?> signInWithGoogle() async {
    return await remoteDataSource.signInWithGoogle();
  }

  @override
  Future<AuthEntity?> signInWithEmail(String email, String password) async {
    return await remoteDataSource.signInWithEmail(email, password);
  }

  @override
  Future<void> signOut() async {
    return await remoteDataSource.signOut();
  }
}
