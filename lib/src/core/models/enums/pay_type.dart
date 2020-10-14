import 'package:json_annotation/json_annotation.dart';

/// Список типов оплаты
enum PayType {
  /// one (O) — одностадийная
  @JsonValue('O')
  one,

  /// two (T) — двухстадийная
  @JsonValue('T')
  two,
}
