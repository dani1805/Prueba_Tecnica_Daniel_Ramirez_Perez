part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {}

class DoChangeLanguage extends LanguageEvent {
  final BuildContext context;
  final String value;

  DoChangeLanguage({required this.context, required this.value});

  @override
  List<Object?> get props => [];
}
