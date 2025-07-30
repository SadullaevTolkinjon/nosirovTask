import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/model/user/user_model.dart';

@Injectable()
class LocalPreference {
  final SharedPreferences _sharedPreferences;
  LocalPreference(this._sharedPreferences);
  final String _user = "user";
  final String _lang = "lang";
  setUser(String user) async {
    await _sharedPreferences.setString(_user, user);
  }

  getUser() {
    String? user = _sharedPreferences.getString(_user);
    return user != null ? UserModel.fromJson(jsonDecode(user)) : null;
  }

  setLang(String lang) async {
    await _sharedPreferences.setString(_lang, lang);
  }

  getLang() {
    return _sharedPreferences.getString(_lang);
  }
}
