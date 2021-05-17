import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'resend_request.g.dart';

/// Метод отправляет все неотправленные уведомления.
///
/// [ResendRequest](https://oplata.tinkoff.ru/develop/api/payments/resend-request/)
@JsonSerializable(includeIfNull: false)
class ResendRequest extends AcquiringRequest {
  /// Создает экземпляр метода по отправки неотправленых уведомлений
  ResendRequest({
    String? signToken,
  }) : super(signToken) {
    validate();
  }

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
      };

  @override
  ResendRequest copyWith({
    String? signToken,
  }) {
    return ResendRequest(
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {}
}
