import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'charge_response.g.dart';

/// Ответ от сервера на автоплатеж
///
/// [ChargeResponse](https://oplata.tinkoff.ru/develop/api/autopayments/charge-response/)
@JsonSerializable()
class ChargeResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на автоплатеж
  ChargeResponse({
    Status status,
    bool success,
    String errorCode,
    String message,
    String details,
    this.orderId,
    this.paymentId,
    this.terminalKey,
    this.amount,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory ChargeResponse.fromJson(Map<String, dynamic> json) =>
      _$ChargeResponseFromJson(json);

  @override
  String toString() {
    return 'ChargeResponse(terminalKey: $terminalKey, amount: $amount, orderId: $orderId, success: $success, status: $status, paymentId: $paymentId, errorCode: $errorCode, message: $message, details: $details)';
  }

  /// Преобразование модели в json
  Map<String, dynamic> toJson() => _$ChargeResponseToJson(this);

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String terminalKey;

  /// Сумма в копейках
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Идентификатор заказа в системе продавца
  @JsonKey(name: JsonKeys.orderId)
  final String orderId;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final String paymentId;
}
