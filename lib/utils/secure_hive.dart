import 'package:hive_flutter/adapters.dart';
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

  ///tokken
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

  ///idwebperson
  static Future<void> writeIdWebPerson(String pIdWebPerson) async {
    final b = box();
    await b.put('IdWebPerson', pIdWebPerson);
  }

  static String readIdWebPerson() {
    final b = box();
    return b.get('IdWebPerson') as String;
  }

  static Future<void> deleteIdWebPerson() async {
    final b = box();
    await b.delete('IdWebPerson');
  }

  ///idperson
  static Future<void> writeIdPerson(String pIdPerson) async {
    final b = box();
    await b.put('IdPerson', pIdPerson);
  }

  static String readIdPerson() {
    final b = box();
    return b.get('IdPerson') as String;
  }

  static Future<void> deleteIdPerson() async {
    final b = box();
    await b.delete('IdPerson');
  }

  ///iduser
  static Future<void> writeIdUser(String pIdUser) async {
    final b = box();
    await b.put('IdUser', pIdUser);
  }

  static String readIdUser() {
    final b = box();
    return b.get('IdUser') as String;
  }

  static Future<void> deleteIdUser() async {
    final b = box();
    await b.delete('IdUser');
  }

  ///idIsPersonNatural
  static Future<void> writeIsPersonNatural(bool pIdUser) async {
    final b = box();
    await b.put('IdUser', pIdUser);
  }

  static bool readIsPersonNatural() {
    final b = box();
    return b.get('IsPersonNatural') as bool;
  }

  static Future<void> deleteIsPersonNatural() async {
    final b = box();
    await b.delete('IsPersonNatural');
  }
}
