import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';

part 'get_add_card_state_request.g.dart';

/// Возвращает статус привязки карты.
///
/// [GetAddCardStateRequest](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
@JsonSerializable(includeIfNull: false)
class GetAddCardStateRequest extends AcquiringRequest {
  /// Создает экземпляр метода по получению статуса привязки карты
  GetAddCardStateRequest({
    required this.requestKey,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory GetAddCardStateRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAddCardStateRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getAddCardState;

  @override
  Map<String, dynamic> toJson() => _$GetAddCardStateRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.requestKey: requestKey,
      };

  @override
  GetAddCardStateRequest copyWith({
    String? requestKey,
    String? signToken,
  }) {
    return GetAddCardStateRequest(
      requestKey: requestKey ?? this.requestKey,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {}

  /// Идентификатор запроса на привязку счета
  @JsonKey(name: JsonKeys.requestKey)
  final String requestKey;
}
