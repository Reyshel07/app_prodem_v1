import 'secure_hive.dart';

/// Small helper used by other blocs/services to obtain the stored token.
class AuthTokenProvider {
  /// Returns the stored token or null if none.
  static String? get token => SecureHive.readToken();

  /// Convenience to build an Authorization header map if token exists.
  static Map<String, String> get authHeader {
    final t = token;
    if (t == null || t.isEmpty) return {};
    return {'Authorization': 'Bearer $t'};
  }
}
