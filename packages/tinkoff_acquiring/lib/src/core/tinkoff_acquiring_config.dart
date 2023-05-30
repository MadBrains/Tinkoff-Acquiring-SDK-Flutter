import '../utils/logger.dart';
import 'models/base/base.dart';

/// {@template proxy_mapping}
/// Функция позволяющая модифицировать запрос к proxy api.
/// Позволяет изменять путь и загаловок запроса.
/// {@endtemplate}
typedef ProxyMapping = ProxyRequest? Function(
  AcquiringRequest request, {
  required bool isDebugMode,
});

/// {@template tinkoff_acquiring_config}
/// Класс позволяет конфигурировать SDK.
/// {@endtemplate}
sealed class TinkoffAcquiringConfig {
  /// Создает экземпляр класса для конфигурирования SDK, через `terminalKey` и `password`.
  ///
  /// Если не передать `password`, то SDK будет работать в режиме passwordless.
  /// Внимание, не все методы поддерживают passwordless режим.
  factory TinkoffAcquiringConfig.credential({
    required String terminalKey,
    String? password,
    bool isDebugMode,
    BaseLogger logger,
  }) = TinkoffAcquiringConfigCredential;

  /// Создает экземпляр класса для конфигурирования SDK, через `terminalKey` при работе с `signToken`
  factory TinkoffAcquiringConfig.token({
    required String terminalKey,
    bool isDebugMode,
    BaseLogger logger,
  }) = TinkoffAcquiringConfigToken;

  /// Создает экземпляр класса для конфигурирования SDK, через `proxy`
  factory TinkoffAcquiringConfig.proxy({
    required String proxyDomain,
    String proxyPath,
    ProxyMapping? mapping,
    Map<String, String>? globalHeaders,
    bool isDebugMode,
    BaseLogger logger,
  }) = TinkoffAcquiringConfigProxy;

  const TinkoffAcquiringConfig._({
    this.isDebugMode = true,
    this.logger = const Logger(),
  });

  /// Параметр для работы с debug сервером
  final bool isDebugMode;

  /// Позволяет использовать свой логгер или заданный
  final BaseLogger logger;

  /// Uri (`/`) до Tinkoff Acquiring
  Uri url(String path) => Uri.https(
        isDebugMode
            ? NetworkSettings.domainDebug
            : NetworkSettings.domainRelease,
        path,
      );

  /// Api Uri (`/v2/`) до Tinkoff Acquiring
  Uri apiUrl(String methodPath) =>
      url(NetworkSettings.apiVersion2 + NetworkSettings.apiPath + methodPath);
}

/// Создает экземпляр класса для конфигурирования SDK, через `terminalKey` и `password`.
///
/// Если не передать `password`, то SDK будет работать в режиме passwordless.
/// Внимание, не все методы поддерживают passwordless режим.
class TinkoffAcquiringConfigCredential extends TinkoffAcquiringConfig {
  /// Создает экземпляр класса для конфигурирования SDK, через `terminalKey` и `password`.
  ///
  /// Если не передать `password`, то SDK будет работать в режиме passwordless.
  /// Внимание, не все методы поддерживают passwordless режим.
  const TinkoffAcquiringConfigCredential({
    required this.terminalKey,
    this.password,
    bool isDebugMode = true,
    BaseLogger logger = const Logger(),
  }) : super._(isDebugMode: isDebugMode, logger: logger);

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  final String terminalKey;

  /// Пароль терминала из личного кабинета
  ///
  /// Выдается продавцу банком при заведении терминала
  final String? password;
}

/// Создает экземпляр класса для конфигурирования SDK, через `terminalKey` при работе с `signToken`
class TinkoffAcquiringConfigToken extends TinkoffAcquiringConfig {
  /// Создает экземпляр класса для конфигурирования SDK, через `terminalKey` при работе с `signToken`
  const TinkoffAcquiringConfigToken({
    required this.terminalKey,
    bool isDebugMode = true,
    BaseLogger logger = const Logger(),
  }) : super._(isDebugMode: isDebugMode, logger: logger);

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  final String terminalKey;
}

/// Создает экземпляр класса для конфигурирования SDK, через `proxy`
class TinkoffAcquiringConfigProxy extends TinkoffAcquiringConfig {
  /// Создает экземпляр класса для конфигурирования SDK, через `proxy`
  const TinkoffAcquiringConfigProxy({
    required this.proxyDomain,
    this.proxyPath = '/',
    this.mapping,
    this.globalHeaders,
    bool isDebugMode = true,
    BaseLogger logger = const Logger(),
  }) : super._(isDebugMode: isDebugMode, logger: logger);

  @override
  Uri url(String path) => Uri.https(
        proxyDomain,
        path,
      );

  /// {@template proxy_domain}
  /// Все запросы будут идти не на `TinkoffAcquiringConfigApi`,
  /// а на ваш сервер (указанный в `proxyUrl`), который должен иметь [terminalKey] и [password],
  /// который в конечном счете будет формировать запросы на `TinkoffAcquiringConfigApi`.
  ///
  /// В формате: `server.com`
  /// {@endtemplate}
  final String proxyDomain;

  /// {@template proxy_path}
  /// Путь до api, по умолчанию `/`
  /// {@endtemplate}
  final String proxyPath;

  /// {@macro proxy_mapping}
  final ProxyMapping? mapping;

  /// {@template global_headers}
  /// Общий заголовок для всех запросов к proxy api.
  /// Добавляются к основным заголовкам и предопределяют их.
  /// Заголовки из [ProxyMapping] добавляються к [globalHeaders] и предопределяют их.
  /// {@endtemplate}
  final Map<String, String>? globalHeaders;
}
