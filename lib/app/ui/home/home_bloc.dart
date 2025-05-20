import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/weather_response_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/weather_response_server_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/domain/weather_repository_impl.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/exception.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherRepositoryImpl weatherRepository;
  WeatherResponseModel weatherResponseModel = WeatherResponseModel.fromServer(
    WeatherResponseServerModel(),
  );

  HomeBloc(this.weatherRepository) : super(HomeInitial()) {
    on<DoSendFormContact>((event, emit) async {
      emit(HomeLoading());
      emit(HomeSuccess());
    });

    on<DoGetWeather>((event, emit) async {
      emit(HomeLoading());
      try {
        weatherResponseModel = await weatherRepository.getWeather(
          event.lat,
          event.lon,
          event.lang,
        );
        emit(HomeLoaded());
      } on MException catch (exception) {
        emit(HomeError(exception.code, exception.message));
      }
    });
  }
}
