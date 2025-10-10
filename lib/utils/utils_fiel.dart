// lib/utils/parser_utils.dart

Map<String, String> parseData(String rawData) {
  final Map<String, String> parsed = {};
  final parts = rawData.split("|");

  for (var part in parts) {
    if (part.trim().isEmpty) continue;
    final keyValue = part.split(": &");
    if (keyValue.length == 2) {
      parsed[keyValue[0].trim()] = keyValue[1].trim();
    }
  }

  return parsed;
}
