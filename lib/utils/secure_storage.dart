import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

/// Helper to store/retrieve the AES key used by HiveAesCipher.
class SecureStorageHelper {
  static const _keyName = 'hive_aes_key_v1';
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Returns a 32-byte Uint8List key. If it doesn't exist, creates one using
  /// Hive.generateSecureKey() (recommended) and stores it base64-encoded in
  /// flutter_secure_storage.
  static Future<Uint8List> getOrCreateKey() async {
    final existing = await _storage.read(key: _keyName);
    if (existing != null) {
      try {
        return Uint8List.fromList(base64Decode(existing));
      } on FormatException catch (_) {
        // Stored value is not valid base64 (maybe it was saved in a wrong format).
        // Remove it and continue to generate a new key.
        await _storage.delete(key: _keyName);
      }
    }

    final keyList = Hive.generateSecureKey();
    final key = Uint8List.fromList(keyList);
    final encoded = base64Encode(key);
    await _storage.write(key: _keyName, value: encoded);
    return key;
  }

  /// For testing only: delete the stored key
  static Future<void> deleteKey() async {
    await _storage.delete(key: _keyName);
  }
}
