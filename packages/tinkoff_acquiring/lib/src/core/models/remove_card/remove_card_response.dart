import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';
import '../enums/card_status.dart';

part 'remove_card_response.g.dart';

/// Ответ от сервера по удалению привязанной карты у покупателя
///
/// [RemoveCardResponse](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable()
class RemoveCardResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера по удалению привязанной карты у покупателя
  RemoveCardResponse({
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.customerKey,
    this.cardId,
    this.cardStatus,
  }) : super(
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory RemoveCardResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveCardResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RemoveCardResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.customerKey: customerKey,
        JsonKeys.cardId: cardId,
        JsonKeys.status: cardStatus,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String? customerKey;

  /// Идентификатор карты в системе Банка
  @JsonKey(name: JsonKeys.cardId)
  final String? cardId;

  /// Статус карты:
  /// 1. A - активная
  /// 2. I - неактивная
  /// 3. D - удалена
  @JsonKey(name: JsonKeys.status, unknownEnumValue: CardStatus.notExist)
  final CardStatus? cardStatus;
}
