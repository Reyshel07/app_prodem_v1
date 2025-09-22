import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDateTime(DateTime date) {
    // Ejemplo: 22/09/2025 11:45 AM
    return DateFormat('dd/MM/yyyy hh:mm a').format(date);
  }

  static String formatDate(DateTime date) {
    // Solo fecha: 22/09/2025
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatTime(DateTime date) {
    // Solo hora: 11:45 AM
    return DateFormat('hh:mm a').format(date);
  }
}
