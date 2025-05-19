part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class DoSendFormContact extends HomeEvent {
  DoSendFormContact();

  @override
  List<Object?> get props => [];
}
