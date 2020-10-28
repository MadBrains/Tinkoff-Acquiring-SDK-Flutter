import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../base/acquiring_request.dart';
import '../common/receipt.dart';
import '../../utils/extensions.dart';

part 'cancel_request.g.dart';

/// Метод отменяет платеж
///
/// [CancelRequest](https://oplata.tinkoff.ru/develop/api/payments/cancel-request/)
@JsonSerializable(includeIfNull: false)
class CancelRequest extends AcquiringRequest {
  /// Создает экземпляр метода по отмене платежа
  CancelRequest(
    this.paymentId, {
    this.amount,
    this.ip,
    this.receipt,
    String signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory CancelRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.cancel;

  @override
  Map<String, dynamic> toJson() => _$CancelRequestToJson(this);

  @override
  Map<String, Object> get equals => <String, Object>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.amount: amount,
        JsonKeys.ip: ip,
        JsonKeys.receipt: receipt,
      };

  @override
  CancelRequest copyWith({
    int paymentId,
    int amount,
    String ip,
    Receipt receipt,
    String signToken,
  }) {
    return CancelRequest(
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
  /// В чеке указываются данные товаров, подлежащих возврату
  ///
  /// См. Структура объекта [Receipt]
  ///
  /// Имеет приоритет над данными, переданными в методе `Init`
  @JsonKey(name: JsonKeys.receipt)
  final Receipt receipt;
}
