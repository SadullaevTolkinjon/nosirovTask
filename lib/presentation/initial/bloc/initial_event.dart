part of 'initial_bloc.dart';

@freezed
class InitialEvent with _$InitialEvent {
  const factory InitialEvent.started() = _Started;
  const factory InitialEvent.changeLang(String lang) = _ChangeLang;
}