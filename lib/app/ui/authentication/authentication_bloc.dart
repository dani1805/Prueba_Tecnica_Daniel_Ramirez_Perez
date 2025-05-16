import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/api/prefs.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUnknown()) {
    on<DoCheckAuthentication>((event, emit) async {
      await Prefs.getStringValue(EnumPrefs.TOKEN).then((value) {
        if (value.isEmpty) {
          emit(AuthenticationUnauthenticated());
        } else {
          emit(AuthenticationAuthenticated());
        }
      });
    });

    on<DoAuthenticated>((event, emit) async {
      await Prefs.setStringValue('app-token', EnumPrefs.TOKEN);
      emit(AuthenticationAuthenticated());
    });

    on<DoUnauthenticated>((event, emit) async {
      await Prefs.setStringValue('', EnumPrefs.TOKEN);
      emit(AuthenticationUnauthenticated());
    });
  }
}
