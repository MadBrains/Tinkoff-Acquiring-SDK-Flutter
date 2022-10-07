import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'charge_qr_response.g.dart';

/// Ответ от сервера на проведение платежа по привязанному счету QR
///
/// [ChargeQrResponse](https://www.tinkoff.ru/kassa/develop/api/payments-sbp/chargeqr-response/)
@JsonSerializable()
class ChargeQrResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на проведение платежа по привязанному счету QR
  ChargeQrResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.orderId,
    this.paymentId,
    this.amount,
    this.currency,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory ChargeQrResponse.fromJson(Map<String, dynamic> json) =>
      _$ChargeQrResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChargeQrResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.orderId: orderId,
        JsonKeys.paymentId: paymentId,
        JsonKeys.amount: amount,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Идентификатор заказа в системе продавца
  @JsonKey(name: JsonKeys.orderId)
  final String? orderId;

  /// Сумма в копейках
  @JsonKey(name: JsonKeys.amount)
  final int? amount;

  /// Код валюты ISO 421.
  @JsonKey(name: JsonKeys.currency)
  final int? currency;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final String? paymentId;
}
