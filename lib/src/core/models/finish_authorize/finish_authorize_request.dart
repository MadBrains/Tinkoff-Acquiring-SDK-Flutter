import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../../../utils/extensions.dart';
import '../base/acquiring_request.dart';
import '../enums/route.dart';
import '../enums/source.dart';

part 'finish_authorize_request.g.dart';

/// Метод подтверждает платеж передачей реквизитов, а также списывает средства с карты покупателя при одностадийной оплате и блокирует указанную сумму при двухстадийной.
///
/// Используется, если у площадки есть сертификация `PCI DSS` и собственная платежная форма.
///
/// Для `ApplePay` (расшифровка токена происходит на стороне `Мерчанта`) надо:
/// 1. Передавать [route] = [Route.acq] и [source] = [Source.applePay];
/// 2. Передавать объект [cardData] Продавец формирует объект [cardData] из расшифрованного параметра `paymentData`, полученного от `Apple`.
///
/// Для `ApplePay` (расшифровка токена происходит на стороне `Банка`) надо:
/// 1. Передавать [route] = [Route.acq] и [source] = [Source.applePay];
/// 2. Передавать параметр [encryptedPaymentData] вместо [cardData] Продавец формирует параметр [encryptedPaymentData] из параметра `paymentData`, закодированное в `Base64`.
/// Параметр `paymentData` `Apple` возвращает в объекте `PKPaymentToken`.
///
/// [FinishAuthorizeRequest](https://oplata.tinkoff.ru/develop/api/payments/finishauthorize-request/)
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
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory FinishAuthorizeRequest.fromJson(Map<String, dynamic> json) =>
      _$FinishAuthorizeRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.finishAuthorize;

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
    assert(paymentId.length <= 20);

    if (cardData != null || encryptedPaymentData != null) {
      assert((cardData != null) ^ (encryptedPaymentData != null));
    }

    if (encryptedPaymentData != null) {
      assert(route != null);
      assert(source != null);
    }

    final int? _amount = amount;
    if (_amount != null) {
      assert(_amount.length <= 10);
    }

    final String? _phone = phone;
    if (_phone != null) {
      final bool match = RegExp(r'^\+[0-9](?:[\d]*)$').hasMatch(_phone);
      assert(_phone.length <= 19 && match);
    }

    final bool? _sendEmail = sendEmail;
    final String? _infoEmail = infoEmail;
    if (_sendEmail == true) {
      final bool match =
          RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
              .hasMatch(infoEmail ?? '');
      assert(_infoEmail != null && _infoEmail.length <= 100 && match);
    }

    final String? _ip = ip;
    if (_ip != null) {
      assert(_ip.length >= 7 && _ip.length <= 45);
    }

    final Route? _route = route;
    final Source? _source = source;
    if (_route != null) {
      assert(_source != null && _source != Source.cards);
    }
  }

  /// Зашифрованные данные карты. См. класс [CardData].
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
