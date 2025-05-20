// ignore_for_file: type_literal_in_constant_pattern

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/domain/weather_repository_impl.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/authentication/authentication_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/home_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/home/home_page.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/language/language_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/login/login_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/login/login_page.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:prueba_tecnica_daniel_ramirez/config/service_locator.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final _key = GlobalKey<NavigatorState>();

  NavigatorState get navigator => _key.currentState!;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => getIt<AuthenticationBloc>()..add(DoCheckAuthentication()),
        ),
        BlocProvider(create: (_) => getIt<LoginBloc>()),
        BlocProvider(create: (_) => getIt<LanguageBloc>()),
        BlocProvider(
          create:
              (_) =>
                  getIt<HomeBloc>()..add(
                    DoGetWeather(
                      lat: 51.6195,
                      lon: -0.3337,
                      lang: context.locale.languageCode,
                    ),
                  ),
        ),
      ],
      child: GetMaterialApp(
        locale: context.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.black,
          ),
          appBarTheme: const AppBarTheme(color: Colors.black),
        ),
        navigatorKey: _key,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          for (final supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode) {
              return supportedLocale;
            }
          }
          return const Locale('en');
        },
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) async {
              switch (state.runtimeType) {
                case AuthenticationUnauthenticated:
                  await navigator.pushAndRemoveUntil(
                    LoginPage.route(),
                    (route) => false,
                  );
                  break;
                case AuthenticationAuthenticated:
                  await navigator.pushAndRemoveUntil(
                    HomePage.route(),
                    (route) => false,
                  );
              }
            },
            child: BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) => child ?? const SizedBox.shrink(),
            ),
          );
        },
        onGenerateRoute: (_) => SplashPage.route(),
      ),
    );
  }
}
