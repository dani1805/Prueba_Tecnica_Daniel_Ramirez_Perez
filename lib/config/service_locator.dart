// ignore_for_file: lines_longer_than_80_chars, cascade_invocations

import 'package:dio/dio.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/api/dio_helper.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/repository/weather_repository.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/domain/weather_repository_impl.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/authentication/authentication_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/home_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/language/language_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/login/login_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/config/environment.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void setup(Environment environment) {
    getIt.registerSingleton<Dio>(DioHelper.build(environment.baseUrl));

    // REPOSITORIES
    getIt.registerFactory<WeatherRepositoryImpl>(() => WeatherRepository());

    // BLOCS
    getIt.registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc());
    getIt.registerFactory<LoginBloc>(() => LoginBloc());
    getIt.registerFactory<LanguageBloc>(() => LanguageBloc());
    getIt.registerFactory<HomeBloc>(
      () => HomeBloc(getIt<WeatherRepositoryImpl>()),
    );
  }
}
