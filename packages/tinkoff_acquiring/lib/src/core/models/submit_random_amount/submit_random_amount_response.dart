import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'submit_random_amount_response.g.dart';

/// Ответ от сервера по подтверждению карты путем блокировки случайной суммы
///
/// [SubmitRandomAmountResponse](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable()
class SubmitRandomAmountResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера по подтверждению карты путем блокировки случайной суммы
  SubmitRandomAmountResponse({
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
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory SubmitRandomAmountResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitRandomAmountResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SubmitRandomAmountResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.customerKey: customerKey,
        JsonKeys.requestKey: requestKey,
        JsonKeys.rebillId: rebillId,
        JsonKeys.cardId: cardId,
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
}
