import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';

part 'payments.g.dart';

/// Объект с информацией о видах оплаты заказа
///
/// [Payments](https://www.tinkoff.ru/kassa/develop/api/receipt#Payments)
@JsonSerializable(includeIfNull: false)
class Payments extends BaseRequest {
  /// Создает экземпляр объекта с информацией о видах оплаты заказа
  Payments({
    required this.electronic,
    this.cash,
    this.advancePayment,
    this.credit,
    this.provision,
  });

  /// Преобразование json в модель
  factory Payments.fromJson(Map<String, dynamic> json) =>
      _$PaymentsFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.electronic: electronic,
        JsonKeys.cash: cash,
        JsonKeys.advancePayment: advancePayment,
        JsonKeys.credit: credit,
        JsonKeys.provision: provision,
      };

  @override
  Map<String, dynamic> toJson() => _$PaymentsToJson(this);

  @override
  Payments copyWith({
    int? cash,
    int? electronic,
    int? advancePayment,
    int? credit,
    int? provision,
  }) {
    return Payments(
      cash: cash ?? this.cash,
      electronic: electronic ?? this.electronic,
      advancePayment: advancePayment ?? this.advancePayment,
      credit: credit ?? this.credit,
      provision: provision ?? this.provision,
    );
  }

  @override
  void validate() {}

  /// Вид оплаты "Наличные". Сумма к оплате в копейках не более 14 знаков.
  @JsonKey(name: JsonKeys.cash)
  final int? cash;

  /// Вид оплаты "Безналичный".
  @JsonKey(name: JsonKeys.electronic)
  final int electronic;

  /// Вид оплаты "Предварительная оплата (Аванс)".
  @JsonKey(name: JsonKeys.advancePayment)
  final int? advancePayment;

  /// Вид оплаты "Постоплата (Кредит)"
  @JsonKey(name: JsonKeys.credit)
  final int? credit;

  /// Вид оплаты "Иная форма оплаты".
  @JsonKey(name: JsonKeys.provision)
  final int? provision;
}
