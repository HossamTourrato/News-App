import 'package:equatable/equatable.dart';


abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInWithGoogleEvent extends AuthEvent {}

class SignInWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  SignInWithEmailEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignOutEvent extends AuthEvent {}

