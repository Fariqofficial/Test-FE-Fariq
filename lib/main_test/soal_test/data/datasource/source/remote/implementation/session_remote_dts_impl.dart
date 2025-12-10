import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter_fariq/main_test/soal_test/data/datasource/source/remote/abstract/session_remote_dts.dart';

class SessionRemoteDTSImpl implements SessionRemoteDTS {
  final SharedPreferences _preferences;
  SessionRemoteDTSImpl(this._preferences);

  static const String keyUsername = 'username';
  static const String keyPassword = 'password';

  @override
  Future<void> clearSession() async {
    print("SEBELUM CLEAR: ${_preferences.getString('username')}");
    await _preferences.remove(keyUsername);
    await _preferences.remove(keyPassword);
    print("SETELAH CLEAR: ${_preferences.getString('username')}");
  }

  @override
  Future<String?> getUsername() async {
    return _preferences.getString(keyUsername);
  }

  @override
  Future<void> saveSession({
    required String username,
    required String password,
  }) async {
    await _preferences.setString(keyUsername, username);
    await _preferences.setString(keyPassword, password);
  }
}
