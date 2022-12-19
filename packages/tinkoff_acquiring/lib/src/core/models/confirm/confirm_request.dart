import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';
import '../common/receipt.dart';
import '../common/shops.dart';

part 'confirm_request.g.dart';

/// Метод подтверждает платеж и списывает ранее заблокированные средства.
/// Используется при двухстадийной оплате. При одностадийной оплате вызывается автоматически.
///
/// Применим только к платежам в статусе `AUTHORIZED`.
/// Статус транзакции перед разблокировкой выставляется в `CONFIRMING`.
/// Сумма списания может быть меньше или равна сумме авторизации.
/// Сумма подтверждения не может быть больше заблокированной.
/// Если сумма подтверждения меньше заблокированной, будет выполнено частичное подтверждение.
///
/// [ConfirmRequest](https://www.tinkoff.ru/kassa/develop/api/payments/confirm-description/)
@JsonSerializable(includeIfNull: false)
class ConfirmRequest extends AcquiringRequest {
  /// Создает экземпляр метода подтверждения платежа
  ConfirmRequest({
    required this.paymentId,
    this.amount,
    this.ip,
    this.receipt,
    this.shops,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory ConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.confirm;

  @override
  Map<String, dynamic> toJson() => _$ConfirmRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.amount: amount,
        JsonKeys.ip: ip,
        JsonKeys.receipt: receipt,
        JsonKeys.shops: shops,
      };

  @override
  ConfirmRequest copyWith({
    String? signToken,
    int? paymentId,
    int? amount,
    String? ip,
    Receipt? receipt,
    List<Shops>? shops,
  }) {
    return ConfirmRequest(
      signToken: signToken ?? this.signToken,
      paymentId: paymentId ?? this.paymentId,
      amount: amount ?? this.amount,
      ip: ip ?? this.ip,
      receipt: receipt ?? this.receipt,
      shops: shops ?? this.shops,
    );
  }

  @override
  void validate() {
    receipt?.validate();
    final List<Shops>? shops = this.shops;
    if (shops != null) {
      for (int i = 0; i < shops.length; i++) {
        shops[i].validate();
      }
    }

    paymentId.validateId(JsonKeys.paymentId, checkNull: true);
    amount.validateId(JsonKeys.amount);
    ip.validateId(JsonKeys.ip);
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;

  /// Сумма в копейках
  ///
  /// Пример: `140000` == `1400.00 рублей`
  @JsonKey(name: JsonKeys.amount)
  final int? amount;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;

  /// Массив данных чека.
  ///
  /// См. Структура объекта [Receipt]
  ///
  /// Имеет приоритет над данными, переданными в методе `Init`
  @JsonKey(name: JsonKeys.receipt)
  final Receipt? receipt;

  /// Массив объектов с данными Маркетплейса
  ///
  /// Имеет приоритет над данными, переданными в методе `Init`
  @JsonKey(name: JsonKeys.shops)
  final List<Shops>? shops;
}
