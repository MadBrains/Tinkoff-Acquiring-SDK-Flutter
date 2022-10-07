import 'package:comparer/comparer.dart';
import 'package:meta/meta.dart';

export '../../../constants.dart';
export '../../../utils/extensions.dart';

/// Базовый класс запроса
@immutable
abstract class BaseRequest extends ComparerMap {
  /// Базовый класс запроса
  BaseRequest() {
    validate();
  }

  @override
  Map<String, Object?> get equals => <String, Object?>{};

  /// Преобразование модели в json
  Map<String, dynamic> toJson();

  /// Создает экземпляр с заданными параметрами
  BaseRequest copyWith();

  /// Метод проверяет валидность данных
  void validate();
}
