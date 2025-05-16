// ignore_for_file: avoid_void_async

/*import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/api/prefs.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationUnknown()) {
    check();
  }

  Future<void> check() async {
    await Prefs.getStringValue(EnumPrefs.TOKEN).then((value) {
      if (value.isEmpty) {
        emit(AuthenticationUnauthenticated());
      } else {
        emit(AuthenticationAuthenticated());
      }
    });
  }

  Future<void> authenticated(String value) async {
    await Prefs.setStringValue(value, EnumPrefs.TOKEN);
    check();
  }

  Future<void> unauthenticated() async {
    await Prefs.setStringValue('', EnumPrefs.TOKEN);
    check();
  }
}*/
