import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveToken(String token) async {
    await _prefs.setString('token', token);
  }

  Future<String?> readToken() async {
    return _prefs.getString('token');
  }

  Future<void> clearToken() async {
    await _prefs.remove('token');
  }
}
