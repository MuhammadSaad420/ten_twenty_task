import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences _prefs;

  // Keys for storing values
  static const String _keyAccessToken = 'access_token';

  SharedPreferencesHelper(this._prefs);

  // Save methods
  void saveAccessToken(String token) {
    _prefs.setString(_keyAccessToken, token);
  }

  // Retrieve methods
  String? getAccessToken() {
    return _prefs.getString(_keyAccessToken);
  }
}
