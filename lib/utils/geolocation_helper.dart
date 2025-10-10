import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GeolocationHelper {
  /// 🧭 Verifica si la ubicación está activada en el dispositivo
  static Future<bool> isLocationServiceEnabled() async {
    final isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();
    // ignore: prefer_interpolation_to_compose_strings
    final messa = isLocationServiceEnabled
        ? "esta habilidato:"
        : "no esta habilitado";
    //print('Error obteniendo ubicación: $messa');
    return isLocationServiceEnabled;
  }

  /// 📍 Obtiene la ubicación actual y retorna un JSON con la dirección
  /// Si no tiene permisos o la ubicación está desactivada, retorna una cadena vacía
  static Future<String> getLocationJson() async {
    try {
      // 1️⃣ Verificar si el servicio de ubicación está habilitado
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        //print('Error obteniendo ubicación: servicio de ubicacion deshabilitada');
        return '';
      }

      // 2️⃣ Verificar permisos
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          //print('Error obteniendo ubicación: LocationPermission.denied');
          return '';
        }
      }
      if (permission == LocationPermission.deniedForever) {
        //print('Error obteniendo ubicación: LocationPermission.deniedForever');
        return '';
      }

      // 3️⃣ Obtener coordenadas actuales usando la nueva API de settings
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.best, // precisión más alta
          distanceFilter: 0, // sin filtro de distancia
        ),
      );

      // 4️⃣ Obtener dirección desde coordenadas
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isEmpty) {
        //print('Error obteniendo ubicación:placemarks vacio');
        return '';
      }

      Placemark lugar = placemarks.first;

      // 5️⃣ Crear JSON
      Map<String, dynamic> jsonData = {
        "adminArea": lugar.administrativeArea,
        "country": lugar.country,
        "featureName": lugar.name,
        "latitude": position.latitude.toString(),
        "longitude": position.longitude.toString(),
        "locality": lugar.locality,
        "subAdminArea": lugar.subAdministrativeArea,
        "subLocality": lugar.subLocality,
        "thoroughfare": lugar.thoroughfare,
      };

      //print('json: ${jsonEncode(jsonData)}') ;

      return jsonEncode(jsonData);
    } catch (e) {
      //print('Error obteniendo ubicación: $e');
      return '';
    }
  }
}
