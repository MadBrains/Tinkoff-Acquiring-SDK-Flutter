import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';

part 'get_add_account_qr_state_request.g.dart';

/// Метод возвращает статус привязки счета Покупателя по магазину в СБП
///
/// [GetAddAccountQrStateRequest](https://www.tinkoff.ru/kassa/develop/api/payments-sbp/getaddaccountqrstate-request/)
@JsonSerializable(includeIfNull: false)
class GetAddAccountQrStateRequest extends AcquiringRequest {
  /// Создает экземпляр метода по получению статуса платежа
  GetAddAccountQrStateRequest({
    required this.requestKey,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory GetAddAccountQrStateRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAddAccountQrStateRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.getAddAccountQrState;

  @override
  Map<String, dynamic> toJson() => _$GetAddAccountQrStateRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.requestKey: requestKey,
      };

  @override
  GetAddAccountQrStateRequest copyWith({
    String? requestKey,
    String? signToken,
  }) {
    return GetAddAccountQrStateRequest(
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
