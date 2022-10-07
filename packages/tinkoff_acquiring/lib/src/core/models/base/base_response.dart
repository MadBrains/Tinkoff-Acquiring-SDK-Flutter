import 'package:comparer/comparer.dart';
import 'package:meta/meta.dart';

export '../../../constants.dart';
export '../../../utils/extensions.dart';

/// Базовый класс ответа
@immutable
abstract class BaseResponse extends ComparerMap {
  @override
  Map<String, Object?> get equals => <String, Object?>{};

  /// Преобразование модели в json
  Map<String, dynamic> toJson();
}
