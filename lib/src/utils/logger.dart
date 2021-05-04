import 'dart:developer' as dev;

/// Интерфейс базового логгера
abstract class BaseLogger {
  /// Конструктор базового логгера
  const BaseLogger();

  /// Метод логирует сообщение
  void log({
    required String message,
    String name = '',
    Object error,
    StackTrace stackTrace,
  });
}

/// Реализация простого логгера
class Logger extends BaseLogger {
  /// Конструктор логгера
  const Logger();

  @override
  void log({
    required String message,
    String name = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    dev.log(message, name: name, error: error, stackTrace: stackTrace);
  }
}
