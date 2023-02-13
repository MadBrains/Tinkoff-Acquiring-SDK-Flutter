import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';

part 'attach_card_request.g.dart';

/// Метод завершает привязку карты к покупателю.
/// Метод дложен вызывается после метода AddCard.
///
/// В случае успешной привязки переадресует клиента на `Success Add Card URL` в противном случае на `Fail Add Card URL`.
///
/// Для прохождения `3DS` второй версии перед вызовом метода должен быть вызван [Check3DSVersionRequest]
/// и выполнен `3DS Method`, который является обязательным при прохождении `3DS` по протоколу версии `2.0`
///
/// [AttachCardRequest](http://static2.tinkoff.ru/acquiring/manuals/android_sdk.pdf)
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
class AttachCardRequest extends AcquiringRequest {
  /// Создает экземпляр метода по привязки карты к покупателю
  AttachCardRequest({
    required this.requestKey,
    required this.cardData,
    this.data,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory AttachCardRequest.fromJson(Map<String, dynamic> json) =>
      _$AttachCardRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.attachCard;

  @override
  Map<String, dynamic> toJson() => _$AttachCardRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.requestKey: requestKey,
        JsonKeys.cardData: cardData,
        JsonKeys.data: data,
      };

  @override
  AttachCardRequest copyWith({
    String? requestKey,
    String? cardData,
    Map<String, String>? data,
    String? signToken,
  }) {
    return AttachCardRequest(
      requestKey: requestKey ?? this.requestKey,
      cardData: cardData ?? this.cardData,
      data: data ?? this.data,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {}

  /// Идентификатор запроса на привязку карты
  @JsonKey(name: JsonKeys.requestKey)
  final String requestKey;

  /// Зашифрованные данные карты. См. класс [PaymentSource].
  @JsonKey(name: JsonKeys.cardData)
  final String cardData;

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
}
