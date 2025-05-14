part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class DoLogin extends LoginEvent {
  final String email;
  final String password;

  DoLogin({required this.email, required this.password});

  @override
  List<Object?> get props => [];
}
