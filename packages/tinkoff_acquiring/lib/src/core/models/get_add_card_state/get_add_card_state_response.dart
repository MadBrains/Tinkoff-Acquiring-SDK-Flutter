import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'get_add_card_state_response.g.dart';

/// Ответ от сервера на статус привязки карты.
///
/// [GetAddCardStateResponse](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable()
class GetAddCardStateResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на статус привязки карты.
  GetAddCardStateResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.requestKey,
    this.customerKey,
    this.cardId,
    this.rebillId,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory GetAddCardStateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAddCardStateResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetAddCardStateResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.requestKey: requestKey,
        JsonKeys.customerKey: customerKey,
        JsonKeys.cardId: cardId,
        JsonKeys.rebillId: rebillId,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Идентификатор запроса на привязку счета
  @JsonKey(name: JsonKeys.requestKey)
  final String? requestKey;

  /// Идентификатор покупателя в системе Продавца
  @JsonKey(name: JsonKeys.customerKey)
  final String? customerKey;

  /// Идентификатор карты в системе Банка
  @JsonKey(name: JsonKeys.cardId)
  final String? cardId;

  /// Идентификатор рекуррентного платежа
  @JsonKey(name: JsonKeys.rebillId)
  final String? rebillId;
}
