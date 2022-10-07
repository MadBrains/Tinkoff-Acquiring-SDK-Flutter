import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../enums/status.dart';

part 'sbp_pay_test_response.g.dart';

/// Ответ от сервера на тестированию платежной сессии с предопределенным статусом по СБП.
///
/// [SbpPayTestResponse](https://www.tinkoff.ru/kassa/develop/api/payments-sbp/sbppaytest-response/)
@JsonSerializable()
class SbpPayTestResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на тестированию платежной сессии с предопределенным статусом по СБП.
  SbpPayTestResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory SbpPayTestResponse.fromJson(Map<String, dynamic> json) =>
      _$SbpPayTestResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SbpPayTestResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
      };
}
