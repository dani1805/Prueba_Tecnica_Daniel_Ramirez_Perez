part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {}

class DoCheckAuthentication extends AuthenticationEvent {
  DoCheckAuthentication();

  @override
  List<Object?> get props => [];
}

class DoAuthenticated extends AuthenticationEvent {
  final String value;

  DoAuthenticated({required this.value});

  @override
  List<Object?> get props => [];
}

class DoUnauthenticated extends AuthenticationEvent {
  DoUnauthenticated();

  @override
  List<Object?> get props => [];
}
