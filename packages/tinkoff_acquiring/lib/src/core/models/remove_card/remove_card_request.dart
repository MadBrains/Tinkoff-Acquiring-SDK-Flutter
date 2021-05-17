import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../../../utils/extensions.dart';
import '../base/acquiring_request.dart';

part 'remove_card_request.g.dart';

/// Метод удаляет привязанную карту у покупателя
///
/// [RemoveCardRequest](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable(includeIfNull: false)
class RemoveCardRequest extends AcquiringRequest {
  /// Создает экземпляр метода по удалению привязанной карты у покупателя
  RemoveCardRequest({
    required this.cardId,
    required this.customerKey,
    this.ip,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory RemoveCardRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoveCardRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.removeCard;

  @override
  Map<String, dynamic> toJson() => _$RemoveCardRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.cardId: cardId,
        JsonKeys.customerKey: customerKey,
        JsonKeys.ip: ip,
      };

  @override
  RemoveCardRequest copyWith({
    int? cardId,
    String? customerKey,
    String? ip,
    String? signToken,
  }) {
    return RemoveCardRequest(
      cardId: cardId ?? this.cardId,
      customerKey: customerKey ?? this.customerKey,
      ip: ip ?? this.ip,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(cardId.length <= 40);
    assert(customerKey.length <= 36);

    final String? _ip = ip;
    if (_ip != null) {
      assert(_ip.length >= 7 && _ip.length <= 45);
    }
  }

  /// Идентификатор карты в системе Банка
  @JsonKey(name: JsonKeys.cardId)
  final int cardId;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String customerKey;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;
}
