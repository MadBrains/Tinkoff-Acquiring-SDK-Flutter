import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../base/acquiring_response.dart';

part 'resend_response.g.dart';

/// Ответ от сервера на отправку неотправленных уведомлений
///
/// [ResendResponse](https://oplata.tinkoff.ru/develop/api/payments/resend-response/)
@JsonSerializable()
class ResendResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на отправку неотправленных уведомлений
  ResendResponse({
    bool success,
    String errorCode,
    String message,
    String details,
    this.terminalKey,
    this.count,
  }) : super(
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory ResendResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendResponseFromJson(json);

  @override
  String toString() {
    return 'ResendResponse(terminalKey: $terminalKey, count: $count, success: $success, errorCode: $errorCode, message: $message, details: $details)';
  }

  /// Преобразование модели в json
  Map<String, dynamic> toJson() => _$ResendResponseToJson(this);

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String terminalKey;

  /// Количество сообщений, отправляемых повторно
  @JsonKey(name: 'Count')
  final int count;
}
