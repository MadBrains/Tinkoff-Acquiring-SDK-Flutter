import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';
import '../common/receipt.dart';
import '../common/shops.dart';
import '../enums/language.dart';
import '../enums/pay_type.dart';

part 'init_request.g.dart';

/// Метод создает платеж: продавец получает ссылку на платежную форму
/// и должен перенаправить по ней покупателя
///
/// [InitRequest](https://www.tinkoff.ru/kassa/develop/api/payments/init-request/)
@JsonSerializable(includeIfNull: false)
class InitRequest extends AcquiringRequest {
  /// Создает экземпляр метода создании платежа
  InitRequest({
    required this.orderId,
    this.amount,
    this.ip,
    this.description,
    this.currency,
    this.customerKey,
    this.recurrent,
    this.language,
    this.redirectDueDate,
    this.notificationUrl,
    this.successUrl,
    this.failUrl,
    this.payType,
    this.receipt,
    this.data,
    this.shops,
    this.descriptor,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory InitRequest.fromJson(Map<String, dynamic> json) =>
      _$InitRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.init;

  @override
  Map<String, dynamic> toJson() => _$InitRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.orderId: orderId,
        JsonKeys.amount: amount,
        JsonKeys.ip: ip,
        JsonKeys.description: description,
        JsonKeys.currency: currency,
        JsonKeys.customerKey: customerKey,
        JsonKeys.recurrent: recurrent,
        JsonKeys.language: language,
        JsonKeys.redirectDueDate: redirectDueDate,
        JsonKeys.notificationUrl: notificationUrl,
        JsonKeys.successUrl: successUrl,
        JsonKeys.failUrl: failUrl,
        JsonKeys.payType: payType,
        JsonKeys.receipt: receipt,
        JsonKeys.data: data,
        JsonKeys.shops: shops,
        JsonKeys.descriptor: descriptor,
      };

  @override
  InitRequest copyWith({
    String? signToken,
    int? amount,
    String? orderId,
    String? ip,
    String? description,
    int? currency,
    Language? language,
    String? recurrent,
    String? customerKey,
    String? redirectDueDate,
    String? notificationUrl,
    String? successUrl,
    String? failUrl,
    PayType? payType,
    Receipt? receipt,
    Map<String, String>? data,
    List<Shops>? shops,
    String? descriptor,
  }) {
    return InitRequest(
      signToken: signToken ?? this.signToken,
      amount: amount ?? this.amount,
      orderId: orderId ?? this.orderId,
      ip: ip ?? this.ip,
      description: description ?? this.description,
      currency: currency ?? this.currency,
      language: language ?? this.language,
      recurrent: recurrent ?? this.recurrent,
      customerKey: customerKey ?? this.customerKey,
      redirectDueDate: redirectDueDate ?? this.redirectDueDate,
      notificationUrl: notificationUrl ?? this.notificationUrl,
      successUrl: successUrl ?? this.successUrl,
      failUrl: failUrl ?? this.failUrl,
      payType: payType ?? this.payType,
      receipt: receipt ?? this.receipt,
      data: data ?? this.data,
      shops: shops ?? this.shops,
      descriptor: descriptor ?? this.descriptor,
    );
  }

  @override
  void validate() {
    receipt?.validate();
    final List<Shops>? shops = this.shops;
    if (shops != null) {
      for (int i = 0; i < shops.length; i++) {
        shops[i].validate();
      }
    }

    orderId.validateId(JsonKeys.orderId, checkNull: true);
    amount.validateAmount(JsonKeys.amount);
    ip.validateIp(JsonKeys.ip);
    description.validateDescription(JsonKeys.description);

    final String? _recurrent = recurrent;
    if (_recurrent != null) {
      assert(_recurrent.length <= 1);
      customerKey.validateCustomerKey(JsonKeys.customerKey, checkNull: true);
    }
  }

  /// Сумма в копейках
  ///
  /// Пример: `140000` == `1400.00 рублей`
  @JsonKey(name: JsonKeys.amount)
  final int? amount;

  /// Идентификатор заказа в системе продавца
  @JsonKey(name: JsonKeys.orderId)
  final String orderId;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;

  /// Описание заказа
  @JsonKey(name: JsonKeys.description)
  final String? description;

  /// Код валюты ISO 421. Если Currency передан и валюта разрешена для Продавца,
  /// транзакция будет инициирована в переданной валюте.
  /// Иначе будет использована валюта по умолчанию для данного терминала.
  ///
  /// В текущей версии допустимы только рубли - код 643
  @JsonKey(name: JsonKeys.currency)
  final int? currency;

  /// Язык платежной формы
  ///
  /// 1. ru — русский
  /// 2. en — английский
  ///
  /// По умолчанию (если параметр не передан) - форма оплаты на русском языке
  @JsonKey(name: JsonKeys.language)
  final Language? language;

  /// Если передается и установлен в Y, то регистрирует платеж как рекуррентный.
  /// В этом случае после оплаты в нотификации на AUTHORIZED будет передан параметр RebillId
  /// для использования в методе Charge
  @JsonKey(name: JsonKeys.recurrent)
  final String? recurrent;

  /// Идентификатор покупателя в системе продавца.
  /// Передается вместе с `cardId` в параметре [data].
  ///
  /// Если передается и Банком разрешена автоматическая привязка карт к терминалу,
  /// то для данного покупателя будет осуществлена привязка карты.
  /// Тогда в нотификации на `AUTHORIZED` будет передан параметр `cardId`,
  /// подробнее см. метод `GetGardList`
  ///
  /// Также необходим для сохранения карт на платежной форме (платежи в один клик).
  @JsonKey(name: JsonKeys.customerKey)
  final String? customerKey;

  /// Cрок жизни ссылки или динамического QR-кода СБП (если выбран данный способ оплаты).
  /// Если текущая дата превышает дату, переданную в данном параметре,
  /// ссылка для оплаты или возможность платежа по QR-коду становятся недоступными и платёж выполнить нельзя.
  ///
  /// - Максимальное значение: 90 дней от текущей даты.
  /// - Минимальное значение: 1 минута от текущей даты.
  ///
  /// Формат даты: YYYY-MM-DDTHH24:MI:SS+GMT; Пример даты: 2016-08-31T12:28:00+03:00
  @JsonKey(name: JsonKeys.redirectDueDate)
  final String? redirectDueDate;

  /// URL на веб-сайте продавца, куда будет отправлен POST запрос
  /// о статусе выполнения вызываемых методов (настраивается в Личном кабинете).
  ///
  /// Если параметр передан – используется его значение.
  /// Если нет – значение в настройках терминала.
  @JsonKey(name: JsonKeys.notificationUrl)
  final String? notificationUrl;

  /// URL на веб-сайте продавца, куда будет переведен покупатель
  /// в случае успешной оплаты (настраивается в Личном кабинете).
  ///
  /// Если параметр передан – используется его значение.
  /// Если нет – значение в настройках терминала.
  @JsonKey(name: JsonKeys.successUrl)
  final String? successUrl;

  /// URL на веб-сайте продавца, куда будет переведен покупатель
  /// в случае неуспешной оплаты (настраивается в Личном кабинете)
  ///
  /// Если параметр передан – используется его значение.
  /// Если нет – значение в настройках терминала.
  @JsonKey(name: JsonKeys.failUrl)
  final String? failUrl;

  /// Тип оплаты
  ///
  /// 1. one (O) — одностадийная
  /// 2. two (T) — двухстадийная
  @JsonKey(name: JsonKeys.payType)
  final PayType? payType;

  /// Данные чека.
  ///
  /// См. Структура объекта [Receipt]
  @JsonKey(name: JsonKeys.receipt)
  final Receipt? receipt;

  /// Дополнительные параметры платежа в формате "ключ":"значение" (не более 20 пар).
  ///
  /// Наименование самого параметра должно быть в верхнем регистре, иначе его содержимое будет игнорироваться.
  ///
  /// Если у терминала включена опция привязки покупателя после успешной оплаты и передается параметр CustomerKey,
  /// то в передаваемых параметрах DATA могут присутствовать параметры метода AddCustomer.
  /// Если они присутствуют, то автоматически привязываются к покупателю.
  /// Например, если указать: "DATA": {"Phone":"+71234567890", "Email":"a@test.com"}
  /// к покупателю автоматически будут привязаны данные Email и телефон, и они будут возвращаться при вызове метода GetCustomer.
  ///
  /// Для МСС 4814 обязательно передать значение в параметре "Phone".
  /// Для МСС 6051 и 6050 обязательно передать параметр “account”
  /// (номер электронного кошелька, не должен превышать 30 символов). Пример: "DATA": {"account":"123456789"}
  ///
  /// Если используется функционал сохранения карт на платежной форме, то при помощи опционального параметра
  /// "DefaultCard" можно задать какая карта будет выбираться по умолчанию. Возможные варианты:
  /// - Оставить платежную форму пустой. Пример: "DATA": {"DefaultCard":"none"};
  /// - Заполнить данными передаваемой карты. В этом случае передается CardId. Пример: "DATA": {"DefaultCard":"894952"};
  /// - Заполнить данными последней сохраненной карты. Применяется, если параметр "DefaultCard" не передан,
  /// передан с некорректным значением или в значении null.
  ///
  /// По умолчанию возможность сохранения карт на платежной форме может быть отключена.
  /// Для активации обратитесь в службу технической поддержки.
  ///
  /// При реализации подключения оплаты Apple Pay Web на сайте мерчанта
  /// необходимо обязательно передавать следующие параметр в объекте Data: "DATA": {"ApplePayWeb":"true"}
  ///
  /// При реализации подключения оплаты Yandex Pay Web необходимо передавать следующий параметр в объекте Data:
  /// "DATA": {"YandexPayWeb":"true"}
  ///
  /// При реализации подключения оплаты Tinkoff Pay Web на сайте мерчанта
  ///  необходимо обязательно передавать следующие параметр в объекте Data:
  /// "DATA": {
  /// "TinkoffPayWeb": "true",
  /// "Device": "Desktop",
  /// "DeviceOs": "iOS",
  /// "DeviceWebView": "true",
  /// "DeviceBrowser": "Safari"
  /// },
  /// где следует передать параметры устройства, с которого будет осуществлен переход
  ///
  /// | Наименование  | Тип     | Обязательность  | Описание |
  /// |---------------|---------|-----------------|----------|
  /// | Device        | String  | Нет             | Тип устройства: SDK (вызов из мобильных приложений), Desktop (вызов из браузера с десктопа), MobileWeb (вызов из браузера с мобильных устройств) |
  /// | DeviceOs      | String  | Нет             | ОС устройства |
  /// | DeviceWebView | Boolean | Нет             | Признак открытия в WebView |
  /// | DeviceBrowser | String  | Нет             | Браузер |
  /// | TinkoffPayWeb | Boolean | Нет             | Признак проведения операции через Tinkoff Pay по API |
  ///
  /// В случае если не удается определить параметр гарантированно (режим инкогнито и пр.) – не передавать параметр.
  @JsonKey(name: JsonKeys.data)
  final Map<String, String>? data;

  /// Массив объектов с данными Маркетплейса
  @JsonKey(name: JsonKeys.shops)
  final List<Shops>? shops;

  /// Динамический дескриптор точки
  @JsonKey(name: JsonKeys.descriptor)
  final String? descriptor;
}
