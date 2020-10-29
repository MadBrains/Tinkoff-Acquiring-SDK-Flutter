import 'package:meta/meta.dart';

import './constants.dart';
import './models/add_card/add_card_request.dart';
import './models/add_card/add_card_response.dart';
import './models/add_customer/add_customer_request.dart';
import './models/add_customer/add_customer_response.dart';
import './models/attach_card/attach_card_request.dart';
import './models/attach_card/attach_card_response.dart';
import './models/base/acquiring_request.dart';
import './models/base/acquiring_response.dart';
import './models/cancel/cancel_request.dart';
import './models/cancel/cancel_response.dart';
import './models/charge/charge_request.dart';
import './models/charge/charge_response.dart';
import './models/check_3ds_version/check_3ds_version_request.dart';
import './models/check_3ds_version/check_3ds_version_response.dart';
import './models/confirm/confirm_request.dart';
import './models/confirm/confirm_response.dart';
import './models/finish_authorize/finish_authorize_request.dart';
import './models/finish_authorize/finish_authorize_response.dart';
import './models/get_card_list/get_card_list_request.dart';
import './models/get_card_list/get_card_list_response.dart';
import './models/get_customer/get_customer_request.dart';
import './models/get_customer/get_customer_response.dart';
import './models/get_state/get_state_request.dart';
import './models/get_state/get_state_response.dart';
import './models/init/init_request.dart';
import './models/init/init_response.dart';
import './models/remove_card/remove_card_request.dart';
import './models/remove_card/remove_card_response.dart';
import './models/remove_customer/remove_customer_request.dart';
import './models/remove_customer/remove_customer_response.dart';
import './models/resend/resend_request.dart';
import './models/resend/resend_response.dart';
import './network/network_client.dart';
import './utils/crypto_utils.dart';
import './utils/logger.dart';

/// Класс позволяет конфигурировать SDK и осуществлять взаимодействие с Tinkoff Acquiring API.
///
/// Методы осуществляют обращение к API
class TinkoffAcquiring {
  /// Создает экземпляр класса для конфигурирования SDK
  TinkoffAcquiring({
    this.terminalKey,
    this.password,
    this.proxyUrl,
    this.debug = true,
    this.logger = const Logger(),
  })  : assert((proxyUrl != null && Uri.parse(proxyUrl).hasAbsolutePath) ^
            (terminalKey != null)),
        assert(debug != null),
        assert(logger != null);

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  final String terminalKey;

  /// Пароль терминала из личного кабинета
  ///
  /// Если вы используете `signToken` в [AcquiringRequest] методах то [password] не обязательный.
  final String password;

  /// Все запросы будут идти не на `TinkoffAcquiringApi`,
  /// а на ваш сервер (указанный в `proxyUrl`), который должен иметь [terminalKey] и [password],
  /// который в конечном счете будет формировать запросы на `TinkoffAcquiringApi`.
  ///
  /// Если вы используете [proxyUrl] то [terminalKey] и [password] не обязательные.
  ///
  /// В формате: `https://server.com/`
  final String proxyUrl;

  /// Параметр для работы с debug сервером
  final bool debug;

  /// Позволяет использовать свой логгер или заданный
  final BaseLogger logger;

  /// Создает токен, на основе [terminalKey], [password], [request]
  ///
  /// Можно использовать только для тестирования
  @visibleForTesting
  static String generateSignToken(
    String terminalKey,
    String password,
    AcquiringRequest request,
  ) {
    final Map<String, dynamic> temp = request.toJson()
      ..addAll(<String, dynamic>{
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.password: password,
      });
    final List<String> sortedKeys = List<String>.from(temp.keys)..sort();
    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < sortedKeys.length; i++) {
      if (!Ignore.ignoredFields.contains(sortedKeys[i])) {
        buffer.write(temp[sortedKeys[i]]);
      }
    }

    return CryptoUtils.sha256(buffer.toString());
  }

  /// Метод подготовки для привязки карты,
  /// необходимо вызвать [TinkoffAcquiring.addCard] перед методом [TinkoffAcquiring.attachCard]
  Future<AddCardResponse> addCard(AddCardRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => AddCardResponse.fromJson(json),
    );
  }

  /// Метод привязки карты, вызывается после [TinkoffAcquiring.addCard]
  Future<AttachCardResponse> attachCard(AttachCardRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => AttachCardResponse.fromJson(json),
    );
  }

  /// Регистрирует покупателя и его данные в системе продавца
  Future<AddCustomerResponse> addCustomer(AddCustomerRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => AddCustomerResponse.fromJson(json),
    );
  }

  /// Отменяет платеж
  Future<CancelResponse> cancel(CancelRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => CancelResponse.fromJson(json),
    );
  }

  /// Осуществляет рекуррентный (повторный) платеж — безакцептное списание денежных средств со счета банковской карты покупателя.
  /// Для возможности его использования покупатель должен совершить хотя бы один платеж в пользу продавца,
  /// который должен быть указан как рекуррентный (см. параметр [InitRequest.recurrent]).
  Future<ChargeResponse> charge(ChargeRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => ChargeResponse.fromJson(json),
    );
  }

  /// Подтверждает платеж и списывает ранее заблокированные средства
  Future<ConfirmResponse> confirm(ConfirmRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => ConfirmResponse.fromJson(json),
    );
  }

  /// Подтверждает инициированный платеж передачей карточных данных
  Future<FinishAuthorizeResponse> finishAuthorize(
      FinishAuthorizeRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => FinishAuthorizeResponse.fromJson(json),
    );
  }

  /// Возвращает список привязанных карт
  Future<GetCardListResponse> getCardList(GetCardListRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => GetCardListResponse.fromJson(json),
    );
  }

  /// Возвращает данные покупателя
  Future<GetCustomerResponse> getCustomer(GetCustomerRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => GetCustomerResponse.fromJson(json),
    );
  }

  /// Возвращает статус платежа
  Future<GetStateResponse> getState(GetStateRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => GetStateResponse.fromJson(json),
    );
  }

  /// Инициирует платежную сессию
  Future<InitResponse> init(InitRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => InitResponse.fromJson(json),
    );
  }

  /// Удаляет привязанную карту
  Future<RemoveCardResponse> removeCard(RemoveCardRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => RemoveCardResponse.fromJson(json),
    );
  }

  /// Удаляет данные зарегистрированного покупателя
  Future<RemoveCustomerResponse> removeCustomer(RemoveCustomerRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => RemoveCustomerResponse.fromJson(json),
    );
  }

  /// Отправляет все неотправленные нотификации
  Future<ResendResponse> resend(ResendRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => ResendResponse.fromJson(json),
    );
  }

  /// Проверяет 3DS протокол
  Future<Check3DSVersionResponse> check3DSVersion(
      Check3DSVersionRequest request) {
    return _createRequest(
      request,
      (Map<String, dynamic> json) => Check3DSVersionResponse.fromJson(json),
    );
  }

  Future<Response> _createRequest<Response extends AcquiringResponse>(
    AcquiringRequest request,
    Response Function(Map<String, dynamic> json) response,
  ) {
    final NetworkClient client = NetworkClient();

    return client.call(
      request,
      _modifyRequest(request),
      response,
      proxyUrl: proxyUrl,
      debug: debug,
      logger: logger,
    );
  }

  Map<String, dynamic> _modifyRequest(AcquiringRequest request) {
    final Map<String, dynamic> temp = request.toJson();
    if (proxyUrl != null) return temp;
    if (request.signToken != null) {
      return temp
        ..addAll(<String, dynamic>{
          JsonKeys.terminalKey: terminalKey,
        });
    }

    final String token = generateSignToken(terminalKey, password, request);
    final Map<String, dynamic> _request = temp
      ..addAll(<String, dynamic>{
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.token: token,
      });

    logger.log('$_request', name: 'Token');
    return _request;
  }
}
