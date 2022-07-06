import '../../../constants.dart';

/// {@template proxy_request}
/// Модель Proxy запроса, позволяет задать свой путь и заголовок при обращении к Proxy API.
/// {@endtemplate}
class ProxyRequest {
  /// {@macro proxy_request}
  const ProxyRequest({
    this.path,
    this.headers = NetworkSettings.baseHeaders,
  });

  /// Путь запроса
  final String? path;

  /// Заголовок запроса
  final Map<String, String>? headers;

  /// Создает экземпляр с заданными параметрами
  ProxyRequest copyWith({
    String? path,
    Map<String, String>? headers,
  }) {
    return ProxyRequest(
      path: path ?? this.path,
      headers: headers ?? this.headers,
    );
  }
}
