import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';

part 'resend_request.g.dart';

/// Метод отправляет все неотправленные уведомления.
///
/// [ResendRequest](https://www.tinkoff.ru/kassa/develop/api/payments/resend-request/)
@JsonSerializable(includeIfNull: false)
class ResendRequest extends AcquiringRequest {
  /// Создает экземпляр метода по отправки неотправленых уведомлений
  ResendRequest({
    this.paymentId,
    this.notificationTypes,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory ResendRequest.fromJson(Map<String, dynamic> json) =>
      _$ResendRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.resend;

  @override
  Map<String, dynamic> toJson() => _$ResendRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.notificationTypes: notificationTypes,
      };

  @override
  ResendRequest copyWith({
    String? signToken,
    String? paymentId,
    String? notificationTypes,
  }) {
    return ResendRequest(
      signToken: signToken ?? this.signToken,
      paymentId: paymentId ?? this.paymentId,
      notificationTypes: notificationTypes ?? this.notificationTypes,
    );
  }

  @override
  void validate() {
    paymentId.validateId(JsonKeys.paymentId);

    assert(
      () {
        if (paymentId != null) return notificationTypes != null;
        return true;
      }(),
    );
  }

  /// Уникальный идентификатор транзакции в системе Банка
  @JsonKey(name: JsonKeys.paymentId)
  final String? paymentId;

  /// Тип нотификации, который необходимо получить из архива повторно.
  ///
  /// Параметр обязателен при передаче PaymentId
  @JsonKey(name: JsonKeys.notificationTypes)
  final String? notificationTypes;
}
