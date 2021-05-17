import 'package:comparer/comparer.dart';
import 'package:meta/meta.dart';

/// Базовый класс запроса
@immutable
abstract class BaseRequest extends ComparerMap {
  @override
  Map<String, Object?> get equals => <String, Object?>{};

  /// Преобразование модели в json
  Map<String, dynamic> toJson();

  /// Создает экземпляр с заданными параметрами
  BaseRequest copyWith();

  /// Метод проверяет валидность данных
  void validate();
}
