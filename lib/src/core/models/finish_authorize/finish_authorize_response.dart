import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'finish_authorize_response.g.dart';

/// Ответ от сервера на подтверждение платежа
///
/// Если в ответе метода FinishAuthorize возвращается статус 3DS_CHECKING,
/// мерчанту необходимо сформировать запрос на URL ACS банка, выпустившего карту (в ответе параметр ACSUrl).
///
/// [FinishAuthorizeResponse](https://oplata.tinkoff.ru/develop/api/payments/finishauthorize-response/)
@JsonSerializable()
class FinishAuthorizeResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на подтверждение платежа
  FinishAuthorizeResponse({
    Status status,
    bool success,
    String errorCode,
    String message,
    String details,
    this.terminalKey,
    this.amount,
    this.orderId,
    this.paymentId,
    this.cardId,
    this.acsUrl,
    this.md,
    this.paReq,
    this.rebillId,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory FinishAuthorizeResponse.fromJson(Map<String, dynamic> json) =>
      _$FinishAuthorizeResponseFromJson(json);

  @override
  String toString() {
    return 'FinishAuthorizeResponse(terminalKey: $terminalKey, orderId: $orderId, success: $success, status: $status, amount: $amount, paymentId: $paymentId, errorCode: $errorCode, message: $message, details: $details, cardId: $cardId, acsUrl: $acsUrl, md: $md, paReq: $paReq, rebillId: $rebillId)';
  }

  /// Преобразование модели в json
  Map<String, dynamic> toJson() => _$FinishAuthorizeResponseToJson(this);

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String terminalKey;

  /// Идентификатор заказа в системе продавца
  @JsonKey(name: JsonKeys.orderId)
  final String orderId;

  /// Сумма в копейках
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final String paymentId;

  /// Идентификатор карты в системе банка. Передается только для сохраненной карты
  @JsonKey(name: JsonKeys.cardId)
  final String cardId;

  /// Адрес перенаправления после аутентификации 3-D Secure
  /// (URL обработчик на стороне мерчанта, принимающий результаты прохождения 3-D Secure)
  @JsonKey(name: JsonKeys.acsUrl)
  final String acsUrl;

  /// Уникальный идентификатор транзакции в системе Банка (возвращается в ответе на FinishAuthorize)
  @JsonKey(name: JsonKeys.md)
  final String md;

  /// Результат аутентификации 3-D Secure (возвращается в ответе на FinishAuthorize)
  @JsonKey(name: JsonKeys.paReq)
  final String paReq;

  /// Идентификатор рекуррентного платежа в системе банка
  @JsonKey(name: JsonKeys.rebillId)
  final String rebillId;
}
