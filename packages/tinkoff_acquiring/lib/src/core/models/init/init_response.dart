import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'init_response.g.dart';

/// Ответ от сервера на создание платежа
///
/// [InitResponse](https://oplata.tinkoff.ru/develop/api/payments/init-response/)
@JsonSerializable()
class InitResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на создание платежа
  InitResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.amount,
    this.orderId,
    this.paymentId,
    this.paymentURL,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory InitResponse.fromJson(Map<String, dynamic> json) =>
      _$InitResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InitResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.amount: amount,
        JsonKeys.orderId: orderId,
        JsonKeys.paymentId: paymentId,
        JsonKeys.paymentUrl: paymentURL,
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

  /// Ссылка на платежную форму
  @JsonKey(name: JsonKeys.paymentUrl)
  final String? paymentURL;
}
