import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';
import '../enums/route.dart';
import '../enums/source.dart';

part 'finish_authorize_request.g.dart';

/// Метод подтверждает платеж передачей реквизитов, а также списывает средства с карты покупателя при одностадийной оплате и блокирует указанную сумму при двухстадийной.
///
/// Используется, если у площадки есть сертификация `PCI DSS` и собственная платежная форма.
///
/// [FinishAuthorizeRequest](https://www.tinkoff.ru/kassa/develop/api/payments/finishauthorize-request/)
///
/// ---
///
/// Для `ApplePay` (расшифровка токена происходит на стороне `Мерчанта`) надо:
/// 1. Передавать [route] = [Route.acq] и [source] = [Source.applePay];
/// 2. Передавать объект [cardData].
///
/// Продавец формирует объект [cardData] из расшифрованного параметра `paymentData`, полученного от `Apple`.
///
/// ---
///
/// Для `ApplePay` (расшифровка токена происходит на стороне `Банка`) надо:
/// 1. Передавать [route] = [Route.acq] и [source] = [Source.applePay];
/// 2. Передавать параметр [encryptedPaymentData] вместо [cardData]
///
/// Продавец формирует параметр [encryptedPaymentData] из параметра `paymentData`, закодированное в `Base64`.
/// Параметр `paymentData` `Apple` возвращает в объекте `PKPaymentToken`.
///
/// ---
///
/// Для `GooglePay` (расшифровка токена происходит на стороне `Мерчанта`) надо:
/// 1. Передавать [route] = [Route.acq] и [source] = [Source.googlePay];
/// 2. Передавать объект [cardData].
///
/// В случае получения от `GooglePay payload` версии `ECv1` содержимое объекта
/// `encryptedMessage.paymentMethodDetails`:
/// - `pan` или `dpan` в `pan` (в зависимости от наличия)
/// - `expirationMont` + `expirationYear` в `ExpDate`
/// - `3dsCryptogram` в `CAVV` (если есть)
/// - `3dsEciIndicator` в `ECI` (если есть);
///
/// В случае получения от `GooglePay payload` версии `ECv2` содержимое объекта
/// `encryptedMessage.paymentMethodDetails`:
/// - `pan` в `pan`
/// - `expirationMont` + `expirationYear` в `ExpDate`
/// - `cryptogram` в `CAVV` (если есть)
/// - `eciIndicator` в `ECI` (если есть)
///
/// В случае получения `CAVV` в `CardData` оплата будет проводиться как оплата токеном, иначе
/// прохождение 3DS будет регулироваться стандартными настройками треминала/платежа.
///
/// ---
///
/// Для `GooglePay` (расшифровка токена происходит на стороне `Банка`) надо:
/// 1. Передавать [route] = [Route.acq] и [source] = [Source.googlePay];
/// 2. Передавать параметр [encryptedPaymentData] вместо [cardData]
///
/// ---
///
/// Для `YandexPay` (расшифровка токена происходит на стороне `Мерчанта`) надо:
/// 1. Передавать [route] = [Route.acq] и [source] = [Source.yandexPay];
/// 2. Передавать в `DATA.transactionId` значение `PaymentToken.messageId`
/// 3. Передавать в `DATA.YandexPayWeb` значение `true`
/// 4. Передавать параметр [cardData]
/// Размапить параметры из расшифрованного токена `event.token`
/// - `paymentMethodDetails.pan` в `pan`
/// - `paymentMethodDetails,expirationMonth` + `paymentMethodDetails.expirationYear` в `ExpDate`
/// - `paymentMethodDetails.cryptogram` в `CAVV` (если есть)
/// - `paymentMethodDetails.eci` в `ECI` (если есть)
///
/// ---
///
/// Для 3DS второй версии в параметрах DATA необходимо передовать следующие параметры:
///
/// | Наименование        | Тип    | Обязательность | deviceChannel | Описание |
/// |---------------------|--------|----------------|---------------|----------|
/// | threeDSCompInd      | String | Да             | 02 - BRW      | Идентификатор выполнения 3DS Method. 'Y' - выполнение метода успешно завершено, 'N' - выполнение метода завершено неуспешно или метод не выполнялся |
/// | javaEnabled         | String | Нет            | 02 - BRW      | Поддерживает ли браузер пользователя Java: true/false. По умолчанию значение "false" |
/// | language            | String | Да             | 02 - BRW      | Язык браузера по формату IETF BCP47. |
/// | colorDepth          | String | Нет            | 02 - BRW      | Глубина цвета в битах. Допустимые значения: 1/4/8/15/16/24/32/48 |
/// | timezone            | String | Да             | 02 - BRW      | Time-zone пользователя. Пример: UTC +5 hours: -300 |
/// | screen_height       | String | Да             | 02 - BRW      | Высота экрана в пикселях |
/// | screen_width        | String | Да             | 02 - BRW      | Ширина экрана в пикселях |
/// | cresCallbackUrl     | String | Да             | 02 - BRW      | URL который будет использоваться для получения результата(CRES) после завершения Challenge Flow(аутентификаци с дополнительным переходом на страницу ACS) |
/// | sdkAppID            | String | Да             | 01 – APP      | Уникальный идентификатор приложения 3DS Requestor, который формируется 3DS SDK при каждой установке или обновлении приложения |
/// | sdkEncData          | String | Да             | 01 – APP      | Данные, собранные SDK. JWE объект, полученный от 3DS SDK, должен быть дополнительно закодирован в base64 строку. |
/// | sdkEphemPubKey      | String | Да             | 01 – APP      | Компонент public key пары ephemeral key, сгенерированный 3DS SDK. JWE объект, полученный от 3DS SDK, должен быть дополнительно закодирован в base64 строку |
/// | sdkMaxTimeout       | String | Да             | 01 – APP      | Максимальное количество времени (в минутах). Значение должно быть больше либо равно 5 символов. |
/// | sdkReferenceNumber  | String | Да             | 01 – APP      | Поставщик и версия 3DS SDK |
/// | sdkTransID          | String | Да             | 01 – APP      | Уникальный идентификатор транзакции, назначенный 3DS SDK для идентификации одной транзакции |
/// | sdkInterface        | String | Да             | 01 – APP      | Список поддерживаемых интерфейсов SDK. Поддерживаемые значения: 01 = Native, 02 = HTML, 03 = Both |
/// | sdkUiType           | String | Да             | 01 – APP      | Список поддерживаемых типов UI. Значения для каждого интерфейса: Native UI = 01–04, HTML UI = 01–05. Поддерживаемые значения: 01 = Text, 02 = Single Select, 03 = Multi Select, 04 = OOB, 05 = HTML Other (valid only for HTML UI). Пример значения: "01,02,03,04,05" |
///
/// Для 3DS Version 2 в HttpHeaders запроса обязательно должны присутсвовать заголовки: “User-Agent” и “Accept”.
@JsonSerializable(includeIfNull: false)
class FinishAuthorizeRequest extends AcquiringRequest {
  /// Создает экземпляр метода подтверждение платежа передачей реквизитов
  FinishAuthorizeRequest({
    required this.paymentId,
    this.cardData,
    this.encryptedPaymentData,
    this.amount,
    this.data,
    this.infoEmail,
    this.ip,
    this.phone,
    this.sendEmail,
    this.route,
    this.source,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory FinishAuthorizeRequest.fromJson(Map<String, dynamic> json) =>
      _$FinishAuthorizeRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.finishAuthorize;

  @override
  Map<String, String> get headers => <String, String>{
        ...super.headers,
        // TODO take out the mock
        if (is3DsVersionV2)
          'Accept': 'text/plain,application/json;q=0.9,*/*;q=0.8',
        // TODO take out the mock
        if (is3DsVersionV2)
          'User-Agent':
              'Mozilla/5.0 (iPhone; CPU iPhone OS 16_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1'
      };

  @override
  Map<String, dynamic> toJson() => _$FinishAuthorizeRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.cardData: cardData,
        JsonKeys.encryptedPaymentData: encryptedPaymentData,
        JsonKeys.amount: amount,
        JsonKeys.data: data,
        JsonKeys.infoEmail: infoEmail,
        JsonKeys.ip: ip,
        JsonKeys.phone: phone,
        JsonKeys.sendEmail: sendEmail,
        JsonKeys.route: route,
        JsonKeys.source: source,
      };

  @override
  FinishAuthorizeRequest copyWith({
    String? cardData,
    String? encryptedPaymentData,
    int? amount,
    Map<String, String>? data,
    String? infoEmail,
    String? ip,
    int? paymentId,
    String? phone,
    bool? sendEmail,
    Route? route,
    Source? source,
    String? signToken,
  }) {
    return FinishAuthorizeRequest(
      paymentId: paymentId ?? this.paymentId,
      cardData: cardData ?? this.cardData,
      encryptedPaymentData: encryptedPaymentData ?? this.encryptedPaymentData,
      amount: amount ?? this.amount,
      data: data ?? this.data,
      infoEmail: infoEmail ?? this.infoEmail,
      ip: ip ?? this.ip,
      phone: phone ?? this.phone,
      sendEmail: sendEmail ?? this.sendEmail,
      route: route ?? this.route,
      source: source ?? this.source,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    paymentId.validateId(JsonKeys.paymentId);

    assert(
      () {
        if (cardData == null && encryptedPaymentData == null) return false;

        if (!((cardData == null) ^ (encryptedPaymentData == null))) {
          return false;
        }

        if (encryptedPaymentData != null) {
          return route != null && source != null;
        }

        return true;
      }(),
    );

    amount.validateAmount(JsonKeys.amount);
    phone.validatePhone(JsonKeys.phone);
    infoEmail.validateEmail(JsonKeys.infoEmail, checkNull: sendEmail == true);
    ip.validateIp(JsonKeys.ip);
  }

  /// Проверка запроса на наличие 3DsV2
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get is3DsVersionV2 => data != null && ip != null;

  /// Зашифрованные данные карты. См. класс [PaymentSource].
  ///
  /// Не используется и не является обязательным, если передается [encryptedPaymentData]
  @JsonKey(name: JsonKeys.cardData)
  final String? cardData;

  /// Данные карт
  ///
  /// Используется и является обязательным только для Apple Pay или Google Pay
  ///
  /// Примечание: можно воспользоваться пакетом [mad_pay](https://pub.dev/packages/mad_pay)
  @JsonKey(name: JsonKeys.encryptedPaymentData)
  final String? encryptedPaymentData;

  /// Сумма в копейках
  ///
  /// Пример: `140000` == `1400.00 рублей`
  @JsonKey(name: JsonKeys.amount)
  final int? amount;

  /// Дополнительные параметры платежа в формате "ключ":"значение" (не более 20 пар).
  ///
  /// Наименование самого параметра должно быть в верхнем регистре, иначе его содержимое будет игнорироваться.
  ///
  /// 1. Если у терминала включена опция привязки покупателя после успешной оплаты и передается параметр CustomerKey, то в передаваемых параметрах DATA могут присутствовать параметры метода AddCustomer. Если они присутствуют, то автоматически привязываются к покупателю.
  /// Например, если указать: "DATA":{"Phone":"+71234567890", "Email":"a@test.com"}, к покупателю автоматически будут привязаны данные Email и телефон, и они будут возвращаться при вызове метода GetCustomer.
  ///
  /// 2. Если используется функционал сохранения карт на платежной форме, то при помощи опционального параметра "DefaultCard" можно задать какая карта будет выбираться по умолчанию. Возможные варианты:
  /// Оставить платежную форму пустой. Пример: "DATA":{"DefaultCard":"none"};
  /// Заполнить данными передаваемой карты. В этом случае передается CardId. Пример: "DATA":{"DefaultCard":"894952"};
  /// Заполнить данными последней сохраненной карты. Применяется, если параметр "DefaultCard" не передан, передан с некорректным значением или в значении null.
  /// По умолчанию возможность сохранения карт на платежной форме может быть отключена. Для активации обратитесь в службу технической поддержки.
  @JsonKey(name: JsonKeys.data)
  final Map<String, String>? data;

  /// Email для отправки информации об оплате
  @JsonKey(name: JsonKeys.infoEmail)
  final String? infoEmail;

  /// IP-адрес клиента
  ///
  /// Обязательный параметр для 3DS второй версии
  /// DS платежной системы требует передавать данный адрес в полном формате,
  /// без каких-либо сокращений (8 групп по 4 символа)
  ///
  /// Данный формат регламентируется на уровне спецификации EMVCo.
  ///
  /// Пример правильного адреса: 2011:0db8:85a3:0101:0101:8a2e:0370:7334
  /// Пример неправильного адреса: 2a00:1fa1:c7da:9285:0:51:838b:1001
  @JsonKey(name: JsonKeys.ip)
  final String? ip;

  /// Уникальный идентификатор транзакции в системе Банка, полученный в ответе на вызов метода `Init`
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;

  /// Телефон клиента
  ///
  /// В формате +{Ц}
  ///
  /// Пример: `+71234567890`
  @JsonKey(name: JsonKeys.phone)
  final String? phone;

  /// Информация на почту:
  /// 1. true – отправлять клиенту информацию на почту об оплате
  /// 2. false – не отправлять
  @JsonKey(name: JsonKeys.sendEmail)
  final bool? sendEmail;

  /// Способ платежа. Возможные значения: ACQ
  ///
  /// Используется и является обязательным для Apple Pay или Google Pay
  @JsonKey(name: JsonKeys.route)
  final Route? route;

  /// Источник платежа.
  ///
  /// Используется и является обязательным для Apple Pay или Google Pay
  @JsonKey(name: JsonKeys.source)
  final Source? source;
}
