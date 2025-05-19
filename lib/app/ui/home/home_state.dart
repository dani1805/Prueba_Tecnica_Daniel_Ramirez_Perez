// ignore_for_file: override_on_non_overriding_member

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  const HomeLoaded();

  @override
  List<Object?> get props => [];
}

class HomeSuccess extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeError extends HomeState {
  final int code;
  final String message;

  const HomeError(this.code, this.message);

  @override
  List<Object?> get props => [];
}
