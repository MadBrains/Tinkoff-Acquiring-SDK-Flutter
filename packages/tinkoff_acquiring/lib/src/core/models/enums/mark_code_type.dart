import 'package:json_annotation/json_annotation.dart';

/// Тип штрих кода
enum MarkCodeType {
  /// код товара, формат которого не идентифицирован, как один из реквизитов
  @JsonValue('Unknown')
  unknown,

  /// код товара в формате EAN-8
  @JsonValue('ean8')
  ean8,

  /// код товара в формате EAN-13
  @JsonValue('ean13')
  ean13,

  /// код товара в формате ITF-14
  @JsonValue('itf14')
  itf14,

  /// код товара в формате GS1, нанесенный на товар, не подлежащий маркировке
  @JsonValue('gs10')
  gs10,

  /// код товара в формате GS1, нанесенный на товар, подлежащий маркировке
  @JsonValue('gs1m')
  gs1m,

  /// код товара в формате короткого кода маркировки, нанесенный на товар
  @JsonValue('short')
  short,

  /// контрольно-идентификационный знак мехового изделия
  @JsonValue('fur')
  fur,

  /// код товара в формате ЕГАИС-2.0
  @JsonValue('egais20')
  egais20,

  /// код товара в формате ЕГАИС-3.0
  @JsonValue('egais30')
  egais30,
}
