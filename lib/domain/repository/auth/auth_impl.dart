import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nosirovtask/data/preference/token_preference.dart';
import 'package:nosirovtask/domain/repository/auth/auth_repo.dart';
import 'package:nosirovtask/domain/repository/main_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final SharedPreferences _sharedPreferences;
  final TokenPreference _preference;
  static const String _onboardingCompletedKey = 'onboarding_completed';

  final MainRepository _mainRepository;

  AuthRepositoryImpl(
      this._sharedPreferences, this._preference, this._mainRepository);

  @override
  Future<bool> hasCompletedOnboarding() async {
    return _sharedPreferences.getBool(_onboardingCompletedKey) ?? false;
  }

  @override
  Future<void> setOnboardingCompleted() async {
    await _sharedPreferences.setBool(_onboardingCompletedKey, true);
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await _preference.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future login(String username, String password) async {
    return "";
  }

  @override
  Future<void> logout() async {
    return;
  }
}
