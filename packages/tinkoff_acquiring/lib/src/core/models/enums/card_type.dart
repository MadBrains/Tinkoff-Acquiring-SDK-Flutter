import 'package:json_annotation/json_annotation.dart';

/// Тип карты
enum CardType {
  /// [writeOffs] — списания
  @JsonValue(0)
  writeOffs,

  /// [replenishment] — пополнения
  @JsonValue(1)
  replenishment,

  /// [writeOffsAndReplenishment] — списания и пополнения
  @JsonValue(2)
  writeOffsAndReplenishment,
}
