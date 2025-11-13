/// Utilidad para trabajar con fechas y timestamps
class DateTimeHelper {
  /// Genera un timestamp ISO 8601 en tiempo real
  /// Formato: "2025-11-12T13:55:00" o con zona horaria "2025-11-12T13:55:00-04:00"
  ///
  /// Ejemplo:
  /// ```dart
  /// String now = DateTimeHelper.getCurrentTimestamp();
  /// // "2025-11-12T13:55:00"
  ///
  /// String withTz = DateTimeHelper.getCurrentTimestamp(includeTimezone: true);
  /// // "2025-11-12T13:55:00-04:00"
  /// ```
  static String getCurrentTimestamp({
    bool includeTimezone = false,
    bool includeMilliseconds = false,
  }) {
    final now = DateTime.now();
    return formatTimestamp(
      now,
      includeTimezone: includeTimezone,
      includeMilliseconds: includeMilliseconds,
    );
  }

  /// Formatea un DateTime a timestamp ISO 8601
  ///
  /// Ejemplo:
  /// ```dart
  /// DateTime date = DateTime(2025, 11, 12, 13, 55, 0);
  /// String formatted = DateTimeHelper.formatTimestamp(date);
  /// // "2025-11-12T13:55:00"
  /// ```
  static String formatTimestamp(
    DateTime dateTime, {
    bool includeTimezone = false,
    bool includeMilliseconds = false,
  }) {
    final String iso = dateTime.toIso8601String();

    if (!includeMilliseconds) {
      // Elimina milisegundos: "2025-11-12T13:55:00.000Z" -> "2025-11-12T13:55:00Z"
      final withoutMs = iso.replaceFirst(RegExp(r'\.\d+'), '');
      if (!includeTimezone) {
        // Elimina timezone: "2025-11-12T13:55:00Z" -> "2025-11-12T13:55:00"
        return withoutMs.replaceFirst('Z', '');
      }
      return withoutMs;
    }

    if (!includeTimezone) {
      // Solo elimina Z si no queremos timezone
      return iso.replaceFirst('Z', '');
    }

    return iso;
  }

  /// Obtiene timestamp actual con formato local (sin UTC)
  /// Ejemplo: "2025-11-12T13:55:00-04:00"
  static String getCurrentTimestampWithLocalTimezone() {
    final now = DateTime.now();
    final offset = now.timeZoneOffset;

    final hours = offset.inHours;
    final minutes = (offset.inMinutes % 60).abs();
    final sign = offset.isNegative ? '-' : '+';

    final tzString =
        '$sign${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
    final dateString = now.toString().split('.')[0]; // "2025-11-12 13:55:00"

    return '${dateString.replaceFirst(' ', 'T')}$tzString';
  }

  /// Parsea un timestamp ISO 8601 a DateTime
  /// Soporta múltiples formatos:
  /// - "2025-11-12T13:55:00"
  /// - "2025-11-12T13:55:00.000"
  /// - "2025-11-12T13:55:00Z"
  /// - "2025-11-12T13:55:00-04:00"
  ///
  /// Ejemplo:
  /// ```dart
  /// DateTime dt = DateTimeHelper.parseTimestamp("2025-11-12T13:55:00");
  /// ```
  static DateTime parseTimestamp(String timestamp) {
    try {
      return DateTime.parse(timestamp);
    } catch (e) {
      throw FormatException('Timestamp inválido: $timestamp. Error: $e');
    }
  }

  /// Diferencia en horas entre dos timestamps
  ///
  /// Ejemplo:
  /// ```dart
  /// String start = "2025-11-12T10:00:00";
  /// String end = "2025-11-12T13:55:00";
  /// Duration diff = DateTimeHelper.getDifference(start, end);
  /// print(diff.inHours); // 3
  /// ```
  static Duration getDifference(String timestamp1, String timestamp2) {
    final dt1 = parseTimestamp(timestamp1);
    final dt2 = parseTimestamp(timestamp2);
    return dt2.difference(dt1);
  }

  /// Formatea un DateTime de forma legible
  ///
  /// Ejemplo:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// String readable = DateTimeHelper.toReadableString(now);
  /// // "12/11/2025 13:55:00"
  /// ```
  static String toReadableString(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year;
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final second = dateTime.second.toString().padLeft(2, '0');

    return '$day/$month/$year $hour:$minute:$second';
  }
}
