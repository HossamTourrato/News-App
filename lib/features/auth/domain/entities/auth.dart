import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String uid;
  final String? email;

  const AuthEntity({required this.uid, this.email});

  @override
  List<Object?> get props => [uid, email];
}
