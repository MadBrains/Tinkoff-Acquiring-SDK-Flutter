import 'dart:convert' as convert;
import 'dart:typed_data';

/// Метод для получения кодированных двоичных данных `Base64` без `Padding`
String base64WithoutPadding(Uint8List value) {
  final String encoded = convert.base64.encode(value);

  if (encoded.endsWith('==')) return encoded.substring(0, encoded.length - 2);
  if (encoded.endsWith('=')) return encoded.substring(0, encoded.length - 1);
  return encoded;
}
