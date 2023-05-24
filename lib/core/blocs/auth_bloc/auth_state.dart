part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class Authenticated extends AuthState {
  final UserModel userModel;
  const Authenticated({
    required this.userModel,
  });
  @override
  List<Object> get props => [userModel];
}

class FailedState extends AuthState {
  final String errorString;
  const FailedState({
    required this.errorString,
  });
  @override
  List<Object> get props => [errorString];
}
