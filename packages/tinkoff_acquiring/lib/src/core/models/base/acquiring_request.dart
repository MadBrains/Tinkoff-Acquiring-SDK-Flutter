import 'package:json_annotation/json_annotation.dart';

import 'base_request.dart';

export '../../../constants.dart';
export '../../../utils/extensions.dart';

/// Базовый класс создания запроса Acquiring API
abstract class AcquiringRequest extends BaseRequest {
  /// Конструктор базового класса для запросов
  AcquiringRequest(this.signToken);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        if (signToken != null) JsonKeys.token: signToken,
      };

  /// Заголовок метода
  Map<String, String> get headers => NetworkSettings.baseHeaders;

  /// Метод запроса
  String get apiMethod;

  /// Опциональный параметр: готовая подпись запроса
  @JsonKey(name: JsonKeys.token)
  final String? signToken;

  @override
  AcquiringRequest copyWith({String? signToken});
}
