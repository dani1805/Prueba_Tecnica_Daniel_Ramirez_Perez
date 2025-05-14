part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginError extends LoginState {
  final int code;
  final String message;

  const LoginError(this.code, this.message);

  @override
  List<Object?> get props => [];
}
