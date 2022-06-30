import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';
import '../enums/mark_code_type.dart';

part 'mark_code.g.dart';

/// Код маркировки в машиночитаемой форме, представленный в виде одного из видов кодов,
/// формируемых в соответствии с требованиями, предусмотренными правилами,
/// для нанесения на потребительскую упаковку, или на товары, или на товарный ярлык.
///
/// [MarkCode](https://www.tinkoff.ru/kassa/develop/api/receipt/ffd12/#MarkCode)
@JsonSerializable(includeIfNull: false)
class MarkCode extends BaseRequest {
  /// Создает экземпляр rод маркировки в машиночитаемой форме
  MarkCode({
    required this.markCodeType,
    required this.value,
  });

  /// Преобразование json в модель
  factory MarkCode.fromJson(Map<String, dynamic> json) =>
      _$MarkCodeFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.markCodeType: markCodeType,
        JsonKeys.value: value,
      };

  @override
  Map<String, dynamic> toJson() => _$MarkCodeToJson(this);

  @override
  MarkCode copyWith({
    MarkCodeType? markCodeType,
    String? value,
  }) {
    return MarkCode(
      markCodeType: markCodeType ?? this.markCodeType,
      value: value ?? this.value,
    );
  }

  @override
  void validate() {
    assert(value.isNotEmpty);
  }

  /// Тип штрих кода. Возможные значения:
  /// - Unknown – код товара, формат которого не идентифицирован, как один из реквизитов
  /// - ean8 – код товара в формате EAN-8
  /// - ean13 – код товара в формате EAN-13
  /// - itf14 – код товара в формате ITF-14
  /// - gs10 – код товара в формате GS1, нанесенный на товар, не подлежащий маркировке
  /// - gs1m – код товара в формате GS1, нанесенный на товар, подлежащий маркировке
  /// - short – код товара в формате короткого кода маркировки, нанесенный на товар
  /// - fur – контрольно-идентификационный знак мехового изделия
  /// - egais20 – код товара в формате ЕГАИС-2.0
  /// - egais30 – код товара в формате ЕГАИС-3.0
  @JsonKey(name: JsonKeys.markCodeType)
  final MarkCodeType markCodeType;

  /// Код маркировки
  @JsonKey(name: JsonKeys.value)
  final String value;
}
