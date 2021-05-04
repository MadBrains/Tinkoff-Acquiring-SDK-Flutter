import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';
import '../common/card_info.dart';

part 'get_card_list_response.g.dart';

/// Ответ от сервера на список привязанных карт у покупателя
///
/// [GetCardListResponse](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable()
class GetCardListResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на список привязанных карт у покупателя
  GetCardListResponse({
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.cardInfo,
  }) : super(
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory GetCardListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCardListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetCardListResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.cardInfo: cardInfo,
      };

  /// Данные карты
  @JsonKey(name: JsonKeys.cardInfo)
  final List<CardInfo>? cardInfo;
}
