import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';

part 'mark_quantity.g.dart';

/// Реквизит «дробное количество маркированного товара».
///
/// [MarkQuantity](https://www.tinkoff.ru/kassa/develop/api/receipt/ffd12/#Items)
@JsonSerializable(includeIfNull: false)
class MarkQuantity extends BaseRequest {
  /// Создает экземпляр реквизита «дробное количество маркированного товара».
  MarkQuantity({
    required this.numerator,
    required this.denominator,
  });

  /// Преобразование json в модель
  factory MarkQuantity.fromJson(Map<String, dynamic> json) =>
      _$MarkQuantityFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.numerator: numerator,
        JsonKeys.denominator: denominator,
      };

  @override
  Map<String, dynamic> toJson() => _$MarkQuantityToJson(this);

  @override
  MarkQuantity copyWith({
    int? numerator,
    int? denominator,
  }) {
    return MarkQuantity(
      numerator: numerator ?? this.numerator,
      denominator: denominator ?? this.denominator,
    );
  }

  @override
  void validate() {}

  /// Числитель дробной части предмета расчета. Значение должно быть строго меньше значения реквизита «знаменатель».
  @JsonKey(name: JsonKeys.numerator)
  final int numerator;

  /// Знаменатель дробной части предмета расчета. Значение равно количеству товара в партии (упаковке), имеющей общий код маркировки товара
  @JsonKey(name: JsonKeys.denominator)
  final int denominator;
}
