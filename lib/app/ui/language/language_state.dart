part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
}

class LanguageInitial extends LanguageState {
  @override
  List<Object?> get props => [];
}

class LanguageLoading extends LanguageState {
  @override
  List<Object?> get props => [];
}

class LanguageSuccess extends LanguageState {
  @override
  List<Object?> get props => [];
}
