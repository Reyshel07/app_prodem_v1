import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoHelper {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// 📱 Obtiene el identificador único del dispositivo
  /// En Android retorna androidId (no IMEI por restricciones)
  /// En iOS retorna identifierForVendor
  /// Si no se puede determinar, retorna "UNKNOWN"
  static Future<String> getDeviceIdentifier() async {
       
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        //bd818720bb7f1ec1 en otro metodos se usa ese imei
        return "c0556d3b362470ac";// androidInfo.id ?? '';
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        return "c0556d3b362470ac";// iosInfo.identifierForVendor ?? '';
      } else {
        return '';
      }
    } catch (e) {
      print('Error obteniendo identificador: $e');
      return '';
    }
  }

  /// 🔍 Retorna toda la información del dispositivo en un Map
  static Future<Map<String, dynamic>> getFullDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return {
          'platform': 'Android',
          'brand': androidInfo.brand,
          'model': androidInfo.model,
          'device': androidInfo.device,
          'version': androidInfo.version.release,
          'id': androidInfo.id,
          'androidId': androidInfo.id,
        };
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        return {
          'platform': 'iOS',
          'name': iosInfo.name,
          'model': iosInfo.model,
          'systemVersion': iosInfo.systemVersion,
          'identifierForVendor': iosInfo.identifierForVendor,
        };
      } else {
        return {'platform': 'Unknown'};
      }
    } catch (e) {
      print('Error obteniendo info: $e');
      return {'platform': 'Unknown'};
    }
  }
}
