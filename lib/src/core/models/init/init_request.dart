import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../../../utils/extensions.dart';
import '../base/acquiring_request.dart';
import '../common/receipt.dart';
import '../enums/language.dart';
import '../enums/pay_type.dart';

part 'init_request.g.dart';

/// Метод создает платеж: продавец получает ссылку на платежную форму
/// и должен перенаправить по ней покупателя
///
/// [InitRequest](https://oplata.tinkoff.ru/develop/api/payments/init-request/)
@JsonSerializable(includeIfNull: false)
class InitRequest extends AcquiringRequest {
  /// Создает экземпляр метода создании платежа
  InitRequest({
    required this.orderId,
    this.amount,
    this.ip,
    this.description,
    this.language,
    this.recurrent,
    this.customerKey,
    this.redirectDueDate,
    this.notificationUrl,
    this.successUrl,
    this.failUrl,
    this.payType,
    this.receipt,
    this.data,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

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
        JsonKeys.language: language,
        JsonKeys.recurrent: recurrent,
        JsonKeys.customerKey: customerKey,
        JsonKeys.redirectDueDate: redirectDueDate,
        JsonKeys.notificationUrl: notificationUrl,
        JsonKeys.successUrl: successUrl,
        JsonKeys.failUrl: failUrl,
        JsonKeys.payType: payType,
        JsonKeys.receipt: receipt,
        JsonKeys.data: data,
      };

  @override
  InitRequest copyWith({
    int? amount,
    String? orderId,
    String? ip,
    String? description,
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
    String? signToken,
  }) {
    return InitRequest(
      orderId: orderId ?? this.orderId,
      amount: amount ?? this.amount,
      ip: ip ?? this.ip,
      description: description ?? this.description,
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
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(orderId.length <= 20);

    final int? _amount = amount;
    if (_amount != null) {
      assert(_amount.length <= 10);
    }

    final String? _ip = ip;
    if (_ip != null) {
      assert(_ip.length >= 7 && _ip.length <= 45);
    }

    final String? _description = description;
    if (_description != null) {
      assert(_description.length <= 250);
    }

    final String? _recurrent = recurrent;
    final String? _customerKey = customerKey;
    if (_recurrent != null) {
      assert(_recurrent.length <= 1);
      assert(_customerKey != null && _customerKey.length <= 36);
    }

    receipt?.validate();
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

  /// Язык платежной формы
  ///
  /// 1. ru — русский
  /// 2. en — английский
  @JsonKey(name: JsonKeys.language)
  final Language? language;

  /// Идентификатор родительского платежа
  ///
  /// Передается со значением Y
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

  /// Cрок жизни ссылки (не более 90 дней)
  ///
  /// Временная метка по стандарту ISO8601 в формате YYYY-MM-DDThh:mm:ss±hh:mm
  @JsonKey(name: JsonKeys.redirectDueDate)
  final String? redirectDueDate;

  /// Адрес для получения http нотификаций
  @JsonKey(name: JsonKeys.notificationUrl)
  final String? notificationUrl;

  /// Страница успеха
  @JsonKey(name: JsonKeys.successUrl)
  final String? successUrl;

  /// Страница ошибки
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
