import '../../../constants.dart';

/// {@template proxy_request}
/// Модель Proxy запроса, позволяет задать свой путь и заголовок при обращении к Proxy API.
/// {@endtemplate}
class ProxyRequest {
  /// {@macro proxy_request}
  const ProxyRequest({
    this.methodPath,
    this.headers = NetworkSettings.baseHeaders,
  });

  /// Путь запроса
  final String? methodPath;

  /// Заголовок запроса
  final Map<String, String>? headers;

  /// Создает экземпляр с заданными параметрами
  ProxyRequest copyWith({
    String? methodPath,
    Map<String, String>? headers,
  }) {
    return ProxyRequest(
      methodPath: methodPath ?? this.methodPath,
      headers: headers ?? this.headers,
    );
  }
}
