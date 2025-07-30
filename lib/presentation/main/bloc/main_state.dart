part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool isLoading,
    @Default(0) int currentPage,
  }) = _MainState;
  factory MainState.initial() => MainState(
        isLoading: false,
        currentPage: 0,
      );
}
