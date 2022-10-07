import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'finish_authorize_response.g.dart';

/// Ответ от сервера на подтверждение платежа
///
/// Если в ответе метода FinishAuthorize возвращается статус 3DS_CHECKING,
/// мерчанту необходимо сформировать запрос на URL ACS банка, выпустившего карту (в ответе параметр ACSUrl).
///
/// [FinishAuthorizeResponse](https://www.tinkoff.ru/kassa/develop/api/payments/finishauthorize-response/)
@JsonSerializable()
class FinishAuthorizeResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на подтверждение платежа
  FinishAuthorizeResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.orderId,
    this.amount,
    this.paymentId,
    this.rebillId,
    this.cardId,
    this.md,
    this.paReq,
    this.fallbackOnTdsV1,
    this.tdsServerTransId,
    this.acsUrl,
    this.acsTransId,
    this.acsInterface,
    this.acsUiTemplate,
    this.acsSignedContent,
    this.acsReferenceNumber,
    this.sdkTransID,
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
  Map<String, dynamic> toJson() => _$FinishAuthorizeResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.amount: amount,
        JsonKeys.orderId: orderId,
        JsonKeys.paymentId: paymentId,
        JsonKeys.cardId: cardId,
        JsonKeys.acsUrl: acsUrl,
        JsonKeys.acsTransId: acsTransId,
        JsonKeys.md: md,
        JsonKeys.paReq: paReq,
        JsonKeys.rebillId: rebillId,
        JsonKeys.fallbackOnTdsV1: fallbackOnTdsV1,
        JsonKeys.tdsServerTransId: tdsServerTransId,
      };

  /// Определение версии 3DS протокола
  bool get is3DsVersion2 =>
      tdsServerTransId?.isNotEmpty == true && acsTransId?.isNotEmpty == true;

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

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final String? paymentId;

  /// Идентификатор карты в системе банка. Передается только для сохраненной карты
  @JsonKey(name: JsonKeys.cardId)
  final String? cardId;

  /// Уникальный идентификатор транзакции в системе Банка (возвращается в ответе на FinishAuthorize)
  @JsonKey(name: JsonKeys.md)
  final String? md;

  /// Результат аутентификации 3-D Secure (возвращается в ответе на FinishAuthorize)
  @JsonKey(name: JsonKeys.paReq)
  final String? paReq;

  /// Идентификатор рекуррентного платежа в системе банка
  @JsonKey(name: JsonKeys.rebillId)
  final String? rebillId;

  /// Резервный вариант для 3-D Secure 1.0, если 3-D Secure 2.0 недоступен
  @JsonKey(name: JsonKeys.fallbackOnTdsV1)
  final bool? fallbackOnTdsV1;

  /// Уникальный идентификатор транзакции, генерируемый 3DS-Server,
  /// обязательный параметр для 3DS второй версии
  @JsonKey(name: JsonKeys.tdsServerTransId)
  final String? tdsServerTransId;

  /// Адрес перенаправления после аутентификации 3-D Secure
  /// (URL обработчик на стороне мерчанта, принимающий результаты прохождения 3-D Secure)
  @JsonKey(name: JsonKeys.acsUrl)
  final String? acsUrl;

  /// Уникальный идентификатор транзакции, присвоенный ACS
  @JsonKey(name: JsonKeys.acsTransId)
  final String? acsTransId;

  /// Интерфейс ACS
  @JsonKey(name: JsonKeys.acsInterface)
  final String? acsInterface;

  /// UI шаблон для ACS
  @JsonKey(name: JsonKeys.acsUiTemplate)
  final String? acsUiTemplate;

  /// Подписанный контент
  @JsonKey(name: JsonKeys.acsSignedContent)
  final String? acsSignedContent;

  /// Справочный номер
  @JsonKey(name: JsonKeys.acsReferenceNumber)
  final String? acsReferenceNumber;

  /// Уникальный идентификатор транзакции, назначенный 3DS SDK для идентификации одной транзакции,
  /// полученный в ответе на FinishAuthorize
  @JsonKey(name: JsonKeys.sdkTransID)
  final String? sdkTransID;
}
