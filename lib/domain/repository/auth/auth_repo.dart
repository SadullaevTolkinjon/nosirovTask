abstract class AuthRepository {
  Future<bool> hasCompletedOnboarding();

  Future<void> setOnboardingCompleted();

  Future<bool> isAuthenticated();

  Future<void> login(String phone, String password);

  Future<void> logout();
}
