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

  //idwebperson
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

  //idperson
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

  //iduser
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
    await b.put('IsPersonNatural', pIdUser);
  }

  static bool readIsPersonNatural() {
    final b = box();
    return b.get('IsPersonNatural') as bool;
  }

  static Future<void> deleteIsPersonNatural() async {
    final b = box();
    await b.delete('IsPersonNatural');
  }

  //IdentityCardNumber
  static Future<void> writeIdentityCardNumber(
    String pIdentityCardNumber,
  ) async {
    final b = box();
    await b.put('IdentityCardNumber', pIdentityCardNumber);
  }

  static String readIdentityCardNumber() {
    final b = box();
    return b.get('IdentityCardNumber') as String;
  }

  static Future<void> deleteIdentityCardNumber() async {
    final b = box();
    await b.delete('IdentityCardNumber');
  }

  //CellPhoneNumber
  static Future<void> writeCellPhoneNumber(String pCellPhoneNumber) async {
    final b = box();
    await b.put('CellPhoneNumber', pCellPhoneNumber);
  }

  static String readCellPhoneNumber() {
    final b = box();
    return b.get('CellPhoneNumber') as String;
  }

  static Future<void> deleteCellPhoneNumber() async {
    final b = box();
    await b.delete('CellPhoneNumber');
  }

  //IsEmployee
  static Future<void> writeIsEmployee(bool pIsEmployee) async {
    final b = box();
    await b.put('IsEmployee', pIsEmployee);
  }

  static bool readIsEmployee() {
    final b = box();
    return b.get('IsEmployee') as bool;
  }

  static Future<void> deleteIsEmployee() async {
    final b = box();
    await b.delete('IsEmployee');
  }

  //PersonName
  static Future<void> writePersonName(String pPersonName) async {
    final b = box();
    await b.put('PersonName', pPersonName);
  }

  static String readPersonName() {
    final b = box();
    return b.get('PersonName') as String;
  }

  static Future<void> deletePersonName() async {
    final b = box();
    await b.delete('PersonName');
  }

  //Theme
  static const _themeKey = 'theme_mode';

  static Future<void> writeTheme(String theme) async {
    await box().put(_themeKey, theme);
  }

  static String? readTheme() => box().get(_themeKey) as String?;

  static Future<void> deleteTheme() async {
    await box().delete(_themeKey);
  }
}
