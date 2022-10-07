import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'resend_response.g.dart';

/// Ответ от сервера на отправку неотправленных уведомлений
///
/// [ResendResponse](https://www.tinkoff.ru/kassa/develop/api/payments/resend-response/)
@JsonSerializable()
class ResendResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на отправку неотправленных уведомлений
  ResendResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.count,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory ResendResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResendResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.customerKey: count,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Количество сообщений, отправленных на повторную рассылку
  @JsonKey(name: JsonKeys.count)
  final int? count;
}
