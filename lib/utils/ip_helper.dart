import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:network_info_plus/network_info_plus.dart';

class IpHelper {
  static final Dio _dio = Dio();

  /// Obtiene la IP local del dispositivo
  /// Retorna '0.0.0.0' si no se encuentra o ocurre un error
  static Future<String> getDeviceIp() async {
    try {
      final info = NetworkInfo();
      final ip = await info.getWifiIP();
      return ip ?? '0.0.0.0';
    } catch (e) {
      //print('Error obteniendo IP: $e');
      return '0.0.0.0';
    }
  }

  ///Verifica si existe conexion a internet
  static Future<bool> hasInternetConnection() async {
    try {
      final connectivity = await Connectivity().checkConnectivity();

      if (connectivity == ConnectivityResult.none) {
        return false; // No hay red activa
      }

      final response = await _dio.get(
        'https://www.google.com',
        options: Options(receiveTimeout: Duration(seconds: 5)),
      );

      return response.statusCode == 200;
    } catch (e) {
      //print('No hay conexión real a internet: $e');
      return false;
    }
  }
}
