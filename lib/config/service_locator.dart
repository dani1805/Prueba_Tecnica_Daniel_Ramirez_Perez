// ignore_for_file: lines_longer_than_80_chars, cascade_invocations

import 'package:dio/dio.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/api/dio_helper.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/authentication/authentication_cubit.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/login/login_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/config/environment.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void setup(Environment environment) {
    getIt.registerSingleton<Dio>(DioHelper.build(environment.baseUrl));

    // REPOSITORIES
    // BLOCS
    getIt.registerLazySingleton<AuthenticationCubit>(
      () => AuthenticationCubit(),
    );
    getIt.registerFactory<LoginBloc>(() => LoginBloc());
  }
}
