import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
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
    Status status,
    bool success,
    String errorCode,
    String message,
    String details,
    this.terminalKey,
    this.customerKey,
    this.requestKey,
    this.rebillId,
    this.cardId,
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
  String toString() {
    return 'AttachCardResponse(terminalKey: $terminalKey, customerKey: $customerKey, requestKey: $requestKey, rebillId: $rebillId, cardId: $cardId, success: $success, status: $status, errorCode: $errorCode, message: $message, details: $details)';
  }

  /// Преобразование модели в json
  Map<String, dynamic> toJson() => _$AttachCardResponseToJson(this);

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String terminalKey;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String customerKey;

  /// Идентификатор запроса на привязку карты
  @JsonKey(name: JsonKeys.requestKey)
  final String requestKey;

  /// Идентификатор рекуррентного платежа в системе банка
  @JsonKey(name: JsonKeys.rebillId)
  final int rebillId;

  /// Идентификатор карты в системе Банка
  @JsonKey(name: JsonKeys.cardId)
  final String cardId;
}
