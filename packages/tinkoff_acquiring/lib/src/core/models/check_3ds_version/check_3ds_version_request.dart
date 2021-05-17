import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../../../utils/extensions.dart';
import '../base/acquiring_request.dart';

part 'check_3ds_version_request.g.dart';

/// Метод проверяет поддерживаемую версию 3DS протокола по карточным данным из входящих параметров
///
/// [Check3DSVersionRequest](https://oplata.tinkoff.ru/develop/api/payments/check_3ds_version-request/)
@JsonSerializable(includeIfNull: false)
class Check3DSVersionRequest extends AcquiringRequest {
  /// Создает экземпляр метода по проверки 3DS протокола
  Check3DSVersionRequest({
    required this.paymentId,
    required this.cardData,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory Check3DSVersionRequest.fromJson(Map<String, dynamic> json) =>
      _$Check3DSVersionRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.check3DSVersion;

  @override
  Map<String, dynamic> toJson() => _$Check3DSVersionRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.cardData: cardData,
      };

  @override
  Check3DSVersionRequest copyWith({
    int? paymentId,
    String? cardData,
    String? signToken,
  }) {
    return Check3DSVersionRequest(
      paymentId: paymentId ?? this.paymentId,
      cardData: cardData ?? this.cardData,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(paymentId.length <= 20);
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;

  /// Зашифрованные данные карты. См. класс [CardData].
  @JsonKey(name: JsonKeys.cardData)
  final String cardData;
}
