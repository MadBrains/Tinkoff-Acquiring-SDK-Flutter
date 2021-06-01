import 'package:json_annotation/json_annotation.dart';

/// Тип возвращаемых данных
enum DataType {
  /// В ответе возвращается только `Payload` (по умолчанию)
  @JsonValue('PAYLOAD')
  payload,

  /// В ответе возвращается только `SVG` изображение `QR`
  @JsonValue('IMAGE')
  image,
}
