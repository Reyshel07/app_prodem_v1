import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import 'secure_storage.dart';

class SecureHive {
  static const boxName = 'PrMovil';

  /// Initialize Hive with an AES cipher. Call this early in `main()` before opening boxes.
  static Future<void> init() async {
    await Hive.initFlutter();
    final keyBytes = await SecureStorageHelper.getOrCreateKey();
    final cipher = HiveAesCipher(keyBytes);

    // If the box is already open, close and reopen with cipher.
    if (Hive.isBoxOpen(boxName)) {
      await Hive.close();
      await Hive.initFlutter();
    }

    await Hive.openBox(boxName, encryptionCipher: cipher);
  }

  static Box box() => Hive.box(boxName);

  static Future<void> writeToken(String token) async {
    final b = box();
    await b.put('token', token);
  }

  static String? readToken() {
    final b = box();
    return b.get('token') as String?;
  }

  static Future<void> deleteToken() async {
    final b = box();
    await b.delete('token');
  }
}
