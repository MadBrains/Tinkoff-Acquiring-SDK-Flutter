import '../utils/network_client.dart';
import 'models/models.dart';
import 'tinkoff_acquiring_config.dart';

/// {@template tinkoff_acquiring}
/// Класс позволяет осуществлять взаимодействие с Tinkoff Acquiring API.
///
/// Методы осуществляют обращение к API
/// {@endtemplate}
class TinkoffAcquiring {
  /// {@macro tinkoff_acquiring}
  TinkoffAcquiring(this.config) : _network = NetworkClient(config);

  /// {@macro tinkoff_acquiring_config}
  final TinkoffAcquiringConfig config;

  /// {@macro network_client}
  final NetworkClient _network;

  /// Метод подготовки для привязки карты,
  /// необходимо вызвать [TinkoffAcquiring.addCard] перед методом [TinkoffAcquiring.attachCard]
  Future<AddCardResponse> addCard(AddCardRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => AddCardResponse.fromJson(json),
    );
  }

  /// Метод привязки карты, вызывается после [TinkoffAcquiring.addCard]
  Future<AttachCardResponse> attachCard(AttachCardRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => AttachCardResponse.fromJson(json),
    );
  }

  /// Регистрирует покупателя и его данные в системе продавца
  Future<AddCustomerResponse> addCustomer(AddCustomerRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => AddCustomerResponse.fromJson(json),
    );
  }

  /// Отменяет платеж
  Future<CancelResponse> cancel(CancelRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => CancelResponse.fromJson(json),
    );
  }

  /// Осуществляет рекуррентный (повторный) платеж — безакцептное списание денежных средств со счета банковской карты покупателя.
  /// Для возможности его использования покупатель должен совершить хотя бы один платеж в пользу продавца,
  /// который должен быть указан как рекуррентный (см. параметр [InitRequest.recurrent]).
  Future<ChargeResponse> charge(ChargeRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => ChargeResponse.fromJson(json),
    );
  }

  /// Подтверждает платеж и списывает ранее заблокированные средства
  Future<ConfirmResponse> confirm(ConfirmRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => ConfirmResponse.fromJson(json),
    );
  }

  /// Подтверждает инициированный платеж передачей карточных данных
  Future<FinishAuthorizeResponse> finishAuthorize(
    FinishAuthorizeRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) => FinishAuthorizeResponse.fromJson(json),
    );
  }

  /// Возвращает список привязанных карт
  Future<GetCardListResponse> getCardList(GetCardListRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => GetCardListResponse.fromJson(json),
    );
  }

  /// Возвращает данные покупателя
  Future<GetCustomerResponse> getCustomer(GetCustomerRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => GetCustomerResponse.fromJson(json),
    );
  }

  /// Возвращает статус платежа
  Future<GetStateResponse> getState(GetStateRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => GetStateResponse.fromJson(json),
    );
  }

  /// Инициирует платежную сессию
  Future<InitResponse> init(InitRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => InitResponse.fromJson(json),
    );
  }

  /// Удаляет привязанную карту
  Future<RemoveCardResponse> removeCard(RemoveCardRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => RemoveCardResponse.fromJson(json),
    );
  }

  /// Удаляет данные зарегистрированного покупателя
  Future<RemoveCustomerResponse> removeCustomer(RemoveCustomerRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => RemoveCustomerResponse.fromJson(json),
    );
  }

  /// Отправляет все неотправленные нотификации
  Future<ResendResponse> resend(ResendRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => ResendResponse.fromJson(json),
    );
  }

  /// Отправить закрывающий чек в кассу
  Future<SendClosingReceiptResponse> sendClosingReceipt(
    SendClosingReceiptRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) => SendClosingReceiptResponse.fromJson(json),
    );
  }

  /// Проверяет 3DS протокол
  Future<Check3DSVersionResponse> check3DSVersion(
    Check3DSVersionRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) => Check3DSVersionResponse.fromJson(json),
    );
  }

  /// Возвращает ответ от сервера на регистрацию QR
  Future<GetQrResponse> getQr(GetQrRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => GetQrResponse.fromJson(json),
    );
  }

  /// Возвращает ответ от сервера на статического QR
  Future<GetStaticQrResponse> getStaticQr(GetStaticQrRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => GetStaticQrResponse.fromJson(json),
    );
  }

  /// Возвращает текущий статус платежа.
  Future<CheckOrderResponse> checkOrder(CheckOrderRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => CheckOrderResponse.fromJson(json),
    );
  }

  /// Возвращает список банков, куда может быть осуществлен возврат платежа по СБП, совершенного по QR
  Future<QrMembersListResponse> qrMembersList(QrMembersListRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => QrMembersListResponse.fromJson(json),
    );
  }

  /// Инициирует привязку счета покупателя к магазину в СБП и возвращает информацию о нём
  Future<AddAccountQrResponse> addAccountQr(AddAccountQrRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => AddAccountQrResponse.fromJson(json),
    );
  }

  /// Проведение платежа по привязанному счету QR
  Future<ChargeQrResponse> chargeQr(ChargeQrRequest request) {
    return _network(
      request,
      (Map<String, dynamic> json) => ChargeQrResponse.fromJson(json),
    );
  }

  /// Возвращает статус привязки счета Покупателя по магазину
  Future<GetAddAccountQrStateResponse> getAddAccountQrState(
    GetAddAccountQrStateRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) =>
          GetAddAccountQrStateResponse.fromJson(json),
    );
  }

  /// Возвращает список привязанных счетов покупателя по магазину
  Future<GetAccountQrListResponse> getAccountQrList(
    GetAccountQrListRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) => GetAccountQrListResponse.fromJson(json),
    );
  }

  /// Тестирование платежной сессии с предопределенным статусом по СБП
  Future<SbpPayTestResponse> sbpPayTest(
    SbpPayTestRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) => SbpPayTestResponse.fromJson(json),
    );
  }

  /// Возвращает статус привязки карты
  Future<GetAddCardStateResponse> getAddCardState(
    GetAddCardStateRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) => GetAddCardStateResponse.fromJson(json),
    );
  }

  /// Метод предназначен для подтверждения карты путем блокировки случайной суммы
  Future<SubmitRandomAmountResponse> submitRandomAmount(
    SubmitRandomAmountRequest request,
  ) {
    return _network(
      request,
      (Map<String, dynamic> json) => SubmitRandomAmountResponse.fromJson(json),
    );
  }
}
