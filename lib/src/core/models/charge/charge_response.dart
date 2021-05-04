import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
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
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.orderId,
    this.paymentId,
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
  Map<String, dynamic> toJson() => _$ChargeResponseToJson(this);

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

  /// Сумма в копейках
  @JsonKey(name: JsonKeys.amount)
  final int? amount;

  /// Идентификатор заказа в системе продавца
  @JsonKey(name: JsonKeys.orderId)
  final String? orderId;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final String? paymentId;
}
