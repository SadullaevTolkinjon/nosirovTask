import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class TokenPreference {
  final SharedPreferences _sharedPreferences;
  TokenPreference(this._sharedPreferences);
  final String _key = "token";
  final String _guest = "guest";
  final String _firebaseToken = "firebasetoken";
  setGuestToken(String value) async {
    await _sharedPreferences.setString(_guest, value);
  }

  getGuestToken() async {
    return _sharedPreferences.getString(_guest);
  }

  set(String value) async {
    await _sharedPreferences.setString(_key, value);
  }

  getToken() async {
    return _sharedPreferences.getString(_key);
  }

  clear() async {
    await _sharedPreferences.remove(_key);
  }

  setFirebaseToken(var val) async {
    await _sharedPreferences.setString(_firebaseToken, val);
  }

  getFirebaseToken() async {
    return _sharedPreferences.getString(_firebaseToken);
  }
}
