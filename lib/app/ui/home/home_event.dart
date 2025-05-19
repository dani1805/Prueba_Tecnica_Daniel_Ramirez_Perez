part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class DoSendFormContact extends HomeEvent {
  DoSendFormContact();

  @override
  List<Object?> get props => [];
}

class DoGetWeather extends HomeEvent {
  final double lat;
  final double lon;

  DoGetWeather({required this.lat, required this.lon});

  @override
  List<Object?> get props => throw UnimplementedError();
}
