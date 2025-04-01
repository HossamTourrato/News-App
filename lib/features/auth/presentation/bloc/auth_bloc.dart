import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/auth_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogle signInWithGoogle;
  final SignInWithEmail signInWithEmail;
  final SignOut signOut;

  AuthBloc({
    required this.signInWithGoogle,
    required this.signInWithEmail,
    required this.signOut,
  }) : super(AuthInitial()) {
    on<SignInWithGoogleEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await signInWithGoogle();
      result != null ? emit(Authenticated(result)) : emit(AuthError("Google sign-in failed"));
    });

    on<SignInWithEmailEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await signInWithEmail(event.email, event.password);
      result != null ? emit(Authenticated(result)) : emit(AuthError("Email/Password sign-in failed"));
    });

    on<SignOutEvent>((event, emit) async {
      emit(AuthLoading());
      await signOut();
      emit(AuthInitial());
    });
  }
}
