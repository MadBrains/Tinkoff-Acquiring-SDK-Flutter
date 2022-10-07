import 'package:json_annotation/json_annotation.dart';

import '../enums/status.dart';
import 'base_response.dart';

export '../../../constants.dart';
export '../../../utils/extensions.dart';

part 'acquiring_response.g.dart';

/// Базовый класс ответа Acquiring API
@JsonSerializable()
class AcquiringResponse extends BaseResponse {
  /// Базовый класс ответа Acquiring API
  AcquiringResponse({
    this.success,
    this.status,
    this.errorCode,
    this.message,
    this.details,
  });

  /// Преобразование json в модель
  factory AcquiringResponse.fromJson(Map<String, dynamic> json) =>
      _$AcquiringResponseFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.success: success,
        JsonKeys.status: status,
        JsonKeys.errorCode: errorCode,
        JsonKeys.message: message,
        JsonKeys.details: details,
      };

  @override
  Map<String, dynamic> toJson() => _$AcquiringResponseToJson(this);

  /// Проверка наличии ошибки
  bool get hasError => success == false && errorCode != '0';

  /// Выполнение операции
  @JsonKey(name: JsonKeys.success)
  final bool? success;

  /// Статус в ответе на запрос методов
  ///
  /// [Status](https://www.tinkoff.ru/kassa/develop/api/payments/)
  @JsonKey(name: JsonKeys.status, unknownEnumValue: Status.notExist)
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
