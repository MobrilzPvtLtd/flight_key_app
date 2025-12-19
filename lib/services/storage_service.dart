import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  late SharedPreferences _prefs;

  static const String TOKEN_KEY = 'auth_token';
  static const String USER_KEY = 'user_data';

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // String
  String? getString(String key) => _prefs.getString(key);
  Future<bool> setString(String key, String value) =>
      _prefs.setString(key, value);

  // Int
  int? getInt(String key) => _prefs.getInt(key);
  Future<bool> setInt(String key, int value) =>
      _prefs.setInt(key, value);

  // Bool
  bool? getBool(String key) => _prefs.getBool(key);
  Future<bool> setBool(String key, bool value) =>
      _prefs.setBool(key, value);

  // Remove
  Future<bool> remove(String key) => _prefs.remove(key);

  // Clear all
  Future<bool> clearAll() => _prefs.clear();

  // Check exists
  bool hasData(String key) => _prefs.containsKey(key);

  // Auth helpers
  String? get token => getString(TOKEN_KEY);
  Future<bool> saveToken(String token) => setString(TOKEN_KEY, token);
  Future<bool> removeToken() => remove(TOKEN_KEY);
  bool get isLoggedIn => hasData(TOKEN_KEY);
}