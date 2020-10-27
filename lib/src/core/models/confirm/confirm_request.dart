import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../base/acquiring_request.dart';
import '../common/receipt.dart';
import '../../utils/extensions.dart';

part 'confirm_request.g.dart';

/// Метод подтверждает платеж и списывает ранее заблокированные средства.
///
/// Используется при двухстадийной оплате. При одностадийной оплате вызывается автоматически.
/// Применим к платежу только в статусе `AUTHORIZED` и только один раз.
///
/// Сумма подтверждения не может быть больше заблокированной.
/// Если сумма подтверждения меньше заблокированной, будет выполнено частичное подтверждение.
///
/// [ConfirmRequest](https://oplata.tinkoff.ru/develop/api/payments/confirm-request/)
@JsonSerializable(includeIfNull: false)
class ConfirmRequest extends AcquiringRequest {
  /// Создает экземпляр метода подтверждения платежа
  ConfirmRequest(
    this.paymentId, {
    this.amount,
    this.ip,
    this.receipt,
    String signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory ConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.confirm;

  @override
  Map<String, dynamic> toJson() => _$ConfirmRequestToJson(this);

  @override
  ConfirmRequest copyWith({
    int paymentId,
    int amount,
    String ip,
    Receipt receipt,
    String signToken,
  }) {
    return ConfirmRequest(
      paymentId ?? this.paymentId,
      amount: amount ?? this.amount,
      ip: ip ?? this.ip,
      receipt: receipt ?? this.receipt,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(paymentId.length <= 20);

    if (amount != null) {
      assert(amount.length <= 10);
    }

    if (ip != null) {
      assert(ip.length >= 7 && ip.length <= 45);
    }
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;

  /// Сумма в копейках
  ///
  /// Пример: `140000` == `1400.00 рублей`
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String ip;

  /// Массив данных чека.
  ///
  /// См. Структура объекта [Receipt]
  ///
  /// Имеет приоритет над данными, переданными в методе `Init`
  @JsonKey(name: JsonKeys.receipt)
  final Receipt receipt;
}