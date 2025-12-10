abstract class SessionRemoteDTS {
  Future<void> saveSession({
    required String username,
    required String password,
  });
  Future<void> clearSession();
  Future<String?> getUsername();
}
