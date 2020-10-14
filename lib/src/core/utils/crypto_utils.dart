import 'dart:convert' as convert;
import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;
import 'package:crypton/crypton.dart';

/// Класс для работы с криптографией
class CryptoUtils {
  /// Метод для получения хеш-функций `SHA256`
  static String sha256(String string) {
    return crypto.sha256
        .convert(Uint8List.fromList(string.codeUnits))
        .toString();
  }

  /// Метод для получения криптосистемы `RSA`
  ///
  /// Открытый ключ генерируется Банком и выдается при регистрации терминала.
  /// Открытый ключ имеет формат: `X509 RSA 2048`
  static Uint8List rsa(String string, String publicKey) {
    final RSAPublicKey key = RSAPublicKey.fromString(publicKey);
    return key.encryptData(Uint8List.fromList(string.codeUnits));
  }

  /// Метод для получения кодированных двоичных данных `Base64`
  static String base64(Uint8List value) {
    return convert.base64.encode(value);
  }
}
