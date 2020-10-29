import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../../utils/comparer.dart';

/// Базовый класс создания запроса Acquiring API
abstract class AcquiringRequest with Comparer {
  /// Конструктор базового класса для запросов
  AcquiringRequest(this.signToken);

  @override
  Map<String, Object> get equals => <String, Object>{
        JsonKeys.token: signToken,
      };

  /// Метод запроса
  String get apiMethod;

  /// Преобразование модели в json
  Map<String, dynamic> toJson();

  /// Метод проверяет валидность данных
  void validate();

  /// Создает экземпляр с заданными параметрами
  AcquiringRequest copyWith();

  /// Опциональный параметр: готовая подпись запроса
  @JsonKey(name: JsonKeys.token)
  final String signToken;
}
