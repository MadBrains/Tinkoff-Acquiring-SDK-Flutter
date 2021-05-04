import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../enums/status.dart';
import 'base_response.dart';

/// Базовый класс ответа Acquiring API
abstract class AcquiringResponse extends BaseResponse {
  /// Базовый класс ответа Acquiring API
  AcquiringResponse({
    this.success,
    this.status,
    this.errorCode,
    this.message,
    this.details,
  });

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.success: success,
        JsonKeys.status: status,
        JsonKeys.errorCode: errorCode,
        JsonKeys.message: message,
        JsonKeys.details: details,
      };

  /// Выполнение операции
  @JsonKey(name: JsonKeys.success)
  final bool? success;

  /// Статус в ответе на запрос методов
  ///
  /// [Status](https://oplata.tinkoff.ru/develop/api/payments/)
  @JsonKey(name: JsonKeys.status)
  final Status? status;

  /// Код ошибки
  ///
  /// Если ошибки не произошло, передается значение «0»
  @JsonKey(name: JsonKeys.errorCode)
  final String? errorCode;

  /// Краткое описание ошибки
  @JsonKey(name: JsonKeys.message)
  final String? message;

  /// Подробное описание ошибки
  @JsonKey(name: JsonKeys.details)
  final String? details;
}
