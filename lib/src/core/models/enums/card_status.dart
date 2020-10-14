import 'package:json_annotation/json_annotation.dart';

/// Статус карты
enum CardStatus {
  /// A - активная
  @JsonValue('A')
  active,

  /// I - неактивная
  @JsonValue('I')
  inactive,

  /// D - удалена
  @JsonValue('D')
  deleted,

  /// не существует
  notExist,
}
