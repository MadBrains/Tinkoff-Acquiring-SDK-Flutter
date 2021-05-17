import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/base_response.dart';
import '../enums/card_status.dart';
import '../enums/card_type.dart';

part 'card_info.g.dart';

/// Данные карты
@JsonSerializable()
class CardInfo extends BaseResponse {
  /// Данные карты
  CardInfo({
    this.pan,
    this.cardId,
    this.rebillId,
    this.cardType,
    this.expDate,
    this.status,
  });

  /// Преобразование json в модель
  factory CardInfo.fromJson(Map<String, dynamic> json) =>
      _$CardInfoFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.pan: pan,
        JsonKeys.cardId: cardId,
        JsonKeys.rebillId: rebillId,
        JsonKeys.cardType: cardType,
        JsonKeys.expDate: expDate,
        JsonKeys.status: status,
      };

  @override
  Map<String, dynamic> toJson() => _$CardInfoToJson(this);

  /// Номер карты маскированный
  @JsonKey(name: JsonKeys.pan)
  final String? pan;

  /// Идентификатор карты в системе Банка
  @JsonKey(name: JsonKeys.cardId)
  final String? cardId;

  /// Идентификатор рекуррентного платежа в системе банка
  @JsonKey(name: JsonKeys.rebillId)
  final String? rebillId;

  /// Карта:
  /// * 0 — списания
  /// * 1 — пополнения
  /// * 2 — списания и пополнения
  @JsonKey(name: JsonKeys.cardType)
  final CardType? cardType;

  /// Статус карты:
  /// * A - активная
  /// * I - неактивная
  /// * D - удалена
  @JsonKey(name: JsonKeys.status)
  final CardStatus? status;

  /// Срок действия карты
  @JsonKey(name: JsonKeys.expDate)
  final String? expDate;
}
