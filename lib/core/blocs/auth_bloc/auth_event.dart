part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginUser extends AuthEvent {
  final String pass;
  final String phone;
  const LoginUser({
    required this.pass,
    required this.phone,
  });
  @override
  List<Object> get props => [];
}
