import 'package:tinkoff_acquiring/src/constants.dart';
import '../utils/logger.dart';

/// {@template tinkoff_acquiring_config}
/// Класс позволяет конфигурировать SDK.
/// {@endtemplate}
class TinkoffAcquiringConfig {
  /// Создает экземпляр класса для конфигурирования SDK, через `password`
  factory TinkoffAcquiringConfig({
    required String terminalKey,
    required String password,
    bool debug = true,
    BaseLogger logger = const Logger(),
  }) {
    return TinkoffAcquiringConfig._(
      terminalKey: terminalKey,
      password: password,
      debug: debug,
      logger: logger,
    );
  }

  /// Создает экземпляр класса для конфигурирования SDK, через `signToken`
  factory TinkoffAcquiringConfig.token({
    required String terminalKey,
    bool debug = true,
    BaseLogger logger = const Logger(),
  }) {
    return TinkoffAcquiringConfig._(
      terminalKey: terminalKey,
      debug: debug,
      logger: logger,
    );
  }

  /// Создает экземпляр класса для конфигурирования SDK, через `proxy`
  factory TinkoffAcquiringConfig.proxy({
    required String proxyUrl,
    bool debug = true,
    BaseLogger logger = const Logger(),
  }) {
    return TinkoffAcquiringConfig._(
      proxyUrl: proxyUrl,
      debug: debug,
      logger: logger,
    );
  }

  /// Создает экземпляр класса для конфигурирования SDK
  TinkoffAcquiringConfig._({
    this.terminalKey,
    this.password,
    this.proxyUrl,
    this.debug = true,
    this.logger = const Logger(),
  }) : assert((proxyUrl != null && Uri.parse(proxyUrl).hasAbsolutePath) ^
            (terminalKey != null));

  /// Ссылка к `api` на основе `debug` параметра
  String get apiUrl =>
      debug ? NetworkSettings.apiUrlDebug : NetworkSettings.apiUrlRelease;

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  final String? terminalKey;

  /// Пароль терминала из личного кабинета
  ///
  /// Если вы используете `signToken` в [AcquiringRequest] методах то [password] не обязательный.
  final String? password;

  /// Все запросы будут идти не на `TinkoffAcquiringConfigApi`,
  /// а на ваш сервер (указанный в `proxyUrl`), который должен иметь [terminalKey] и [password],
  /// который в конечном счете будет формировать запросы на `TinkoffAcquiringConfigApi`.
  ///
  /// Если вы используете [proxyUrl] то [terminalKey] и [password] не обязательные.
  ///
  /// В формате: `https://server.com/`
  final String? proxyUrl;

  /// Параметр для работы с debug сервером
  final bool debug;

  /// Позволяет использовать свой логгер или заданный
  final BaseLogger logger;
}
