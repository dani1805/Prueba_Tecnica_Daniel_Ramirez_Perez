part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class DoSendFormContact extends HomeEvent {
  DoSendFormContact();

  @override
  List<Object?> get props => [];
}

class DoGetWeather extends HomeEvent {
  final double? lat;
  final double? lon;
  final String lang;

  DoGetWeather({this.lat, this.lon, required this.lang});

  @override
  List<Object?> get props => throw UnimplementedError();
}
