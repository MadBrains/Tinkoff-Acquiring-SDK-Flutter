import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'attach_card_response.g.dart';

/// Ответ от сервера по завершению привязки карты к покупателю
///
/// [AttachCardResponse](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable()
class AttachCardResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера по завершению привязки карты к покупателю
  AttachCardResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.customerKey,
    this.requestKey,
    this.rebillId,
    this.cardId,
    this.acsUrl,
    this.md,
    this.paReq,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory AttachCardResponse.fromJson(Map<String, dynamic> json) =>
      _$AttachCardResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AttachCardResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.customerKey: customerKey,
        JsonKeys.requestKey: requestKey,
        JsonKeys.rebillId: rebillId,
        JsonKeys.cardId: cardId,
        JsonKeys.acsUrl: acsUrl,
        JsonKeys.md: md,
        JsonKeys.paReq: paReq,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String? customerKey;

  /// Идентификатор запроса на привязку карты
  @JsonKey(name: JsonKeys.requestKey)
  final String? requestKey;

  /// Идентификатор рекуррентного платежа в системе банка
  @JsonKey(name: JsonKeys.rebillId)
  final int? rebillId;

  /// Идентификатор карты в системе Банка
  @JsonKey(name: JsonKeys.cardId)
  final String? cardId;

  /// Адрес перенаправления после аутентификации 3-D Secure
  /// (URL обработчик на стороне мерчанта, принимающий результаты прохождения 3-D Secure)
  @JsonKey(name: JsonKeys.acsUrl)
  final String? acsUrl;

  /// Уникальный идентификатор транзакции в системе Банка (возвращается в ответе на FinishAuthorize)
  @JsonKey(name: JsonKeys.md)
  final String? md;

  /// Результат аутентификации 3-D Secure (возвращается в ответе на FinishAuthorize)
  @JsonKey(name: JsonKeys.paReq)
  final String? paReq;
}
