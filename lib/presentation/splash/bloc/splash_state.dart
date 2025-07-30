part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(false) bool isLoading,
    @Default(false) bool isFirstTime,
    @Default(false) bool isAuthenticated,
    @Default(false) bool navigateToOnboarding,
    @Default(false) bool navigateToLogin,
    @Default(false) bool navigateToHome,
  }) = _SplashState;

  factory SplashState.initial() => const SplashState();
}
