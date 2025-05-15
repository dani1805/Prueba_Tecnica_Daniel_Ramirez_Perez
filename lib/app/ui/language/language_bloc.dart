import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<DoChangeLanguage>((event, emit) {
      emit(LanguageLoading());
      event.context.setLocale(Locale(event.value));
      event.context.savedLocale;
      Get.updateLocale(Locale(event.value));
      emit(LanguageSuccess());
    });
  }
}
