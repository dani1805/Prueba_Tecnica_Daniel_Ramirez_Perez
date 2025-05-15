import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/authentication/authentication_cubit.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/language/language_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/login/login_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/login/login_page.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

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
        BlocProvider(create: (_) => AuthenticationCubit()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => LanguageBloc()),
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
          return BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
              navigator.pushAndRemoveUntil(LoginPage.route(), (route) => false);
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
