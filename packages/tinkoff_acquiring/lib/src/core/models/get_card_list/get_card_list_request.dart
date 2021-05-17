import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'get_card_list_request.g.dart';

/// Метод возвращает список привязанных карт у покупателя
///
/// [GetCardListRequest](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable(includeIfNull: false)
class GetCardListRequest extends AcquiringRequest {
  /// Создает экземпляр метода по возвращению списка привязанных карт у покупателя
  GetCardListRequest({
    required this.customerKey,
    this.ip,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory GetCardListRequest.fromJson(Map<String, dynamic> json) =>
      _$GetCardListRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getCardList;

  @override
  Map<String, dynamic> toJson() => _$GetCardListRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.customerKey: customerKey,
        JsonKeys.ip: ip,
      };

  @override
  GetCardListRequest copyWith({
    String? customerKey,
    String? ip,
    String? signToken,
  }) {
    return GetCardListRequest(
      customerKey: customerKey ?? this.customerKey,
      ip: ip ?? this.ip,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(customerKey.length <= 36);

    final String? _ip = ip;
    if (_ip != null) {
      assert(_ip.length >= 7 && _ip.length <= 45);
    }
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.customerKey)
  final String customerKey;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;
}
