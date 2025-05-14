import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/app.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/app_bloc_observer.dart';
import 'package:prueba_tecnica_daniel_ramirez/config/config.dart';
import 'package:prueba_tecnica_daniel_ramirez/config/environment.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  Config.setup(BuildVariant.dev);

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('es'), Locale('en')],
        useOnlyLangCode: true,
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const App(),
      ),
    );
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
