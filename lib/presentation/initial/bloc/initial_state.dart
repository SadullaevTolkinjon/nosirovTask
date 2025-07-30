part of 'initial_bloc.dart';

@freezed
class InitialState with _$InitialState {
  const factory InitialState({
    @Default("ru") String currentLang,
  }) = _InitialState;
  factory InitialState.initial() => InitialState();
}
