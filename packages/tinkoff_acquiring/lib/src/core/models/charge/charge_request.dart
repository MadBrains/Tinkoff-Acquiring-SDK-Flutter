import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';

part 'charge_request.g.dart';

/// Метод осуществляет автоплатеж.
///
/// Осуществляет рекуррентный (повторный) платеж — безакцептное списание денежных средств со счета
/// банковской карты Покупателя.
/// Для возможности его использования Покупатель должен совершить хотя бы один платеж в пользу Продавца,
/// который должен быть указан как рекуррентный,
/// фактически являющийся первичным. По завершении оплаты в нотификации на `AUTHORIZED` будет передан параметр `RebillId`.
/// В дальнейшем для совершения рекуррентного платежа Продавец должен вызвать метод `Init`,
/// а затем без переадресации на `PaymentURL` вызвать метод `Charge` для оплаты по тем же самым реквизитам
/// и передать параметр `RebillId`, полученный при совершении первичного платежа.
/// Метод `Charge` работает по одностадийной и двухстадийной схеме оплаты.
/// Чтобы перейти на двухстадийную схему нужно переключить терминал в [Личном кабинете](https://www.tinkoff.ru/kassa/),
/// а также написать обращение на [acq_help@tinkoff.ru](mailto:acq_help@tinkoff.ru) с просьбой переключить схему рекуррентов.
/// Для использования рекуррентных платежей по одностадийной схеме необходима следующая последовательность действий:
/// 1. Совершить родительский платеж путем вызова `Init` с указанием дополнительных параметров `Recurrent=Y` и `CustomerKey`.
/// 2. Вызвать метод `Check3dsVersion` для проверки ожидаемой версии `3DS` протокола.
/// 3. Вызвать метод `FinishAuthorize` для оплаты заказа.
/// При необходимости, проверить прохождение `3DS` проверки методами `Submit3DSAuthorization/Submit3DSAuthorizationV2`
/// в зависимости от версии `3DS`. После оплаты заказа Покупателем в нотификации на статус `AUTHORIZED`
/// будет передан параметр `RebillId`, который необходимо сохранить.
/// 4. Спустя некоторое время для совершения рекуррентного платежа необходимо вызвать метод `Init`
/// со стандартным набором параметров (параметры `Recurrent` и `CustomerKey` здесь не нужны).
/// 5. Получить в ответ на `Init` параметр `PaymentId`.
/// 6. Вызвать метод `Charge` с параметром `RebillId`, полученным в п.3, и параметром `PaymentId`, полученным в п.5.
/// При успешном сценарии операция перейдет в статус `CONFIRMED`.
///
/// ---
///
/// Для использования рекуррентных платежей по двухстадийной схеме необходима следующая последовательность действий:
/// 1. Совершить родительский платеж путем вызова `Init` с указанием дополнительных параметров `Recurrent=Y` и `CustomerKey`.
/// 2. Вызвать метод `Check3dsVersion` для проверки ожидаемой версии `3DS` протокола.
/// 3. Вызвать метод `FinishAuthorize` для оплаты заказа. При необходимости, проверить прохождение `3DS` проверки методами
/// `Submit3DSAuthorization/Submit3DSAuthorizationV2` в зависимости от версии `3DS`.
/// После оплаты заказа Покупателем в нотификации на статус `AUTHORIZED` будет передан параметр `RebillId`,
/// который необходимо сохранить.
/// 4. Вызвать метод `Confirm` для подтверждения платежа. При необходимости отмены платежа вызвать метод `Cancel`.
/// 5. Спустя некоторое время для совершения рекуррентного платежа необходимо вызвать метод `Init`
/// со стандартным набором параметров (параметры `Recurrent` и `CustomerKey` здесь не нужны).
/// 6. Получить в ответ на `Init` параметр `PaymentId`
/// 7. Вызвать метод `Charge` с параметром `RebillId`, полученным в п.3, и параметром `PaymentId`, полученным в п.5.
/// При успешном сценарии операция перейдет в статус `AUTHORIZED`.
/// Денежные средства будут заблокированы на карте покупателя.
/// 8. Вызвать метод `Confirm` для подтверждения платежа.
///
/// [ChargeRequest](https://www.tinkoff.ru/kassa/develop/api/autopayments/charge-description/)
@JsonSerializable(includeIfNull: false)
class ChargeRequest extends AcquiringRequest {
  /// Создает экземпляр метода автоплатежа
  ChargeRequest({
    required this.paymentId,
    required this.rebillId,
    this.ip,
    this.sendEmail,
    this.infoEmail,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory ChargeRequest.fromJson(Map<String, dynamic> json) =>
      _$ChargeRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.charge;

  @override
  Map<String, dynamic> toJson() => _$ChargeRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.rebillId: rebillId,
        JsonKeys.sendEmail: sendEmail,
        JsonKeys.infoEmail: infoEmail,
        JsonKeys.ip: ip,
      };

  @override
  ChargeRequest copyWith({
    int? paymentId,
    int? rebillId,
    bool? sendEmail,
    String? infoEmail,
    String? ip,
    String? signToken,
  }) {
    return ChargeRequest(
      paymentId: paymentId ?? this.paymentId,
      rebillId: rebillId ?? this.rebillId,
      sendEmail: sendEmail ?? this.sendEmail,
      infoEmail: infoEmail ?? this.infoEmail,
      ip: ip ?? this.ip,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    paymentId.validateId(JsonKeys.paymentId, checkNull: true);
    rebillId.validateId(JsonKeys.rebillId, checkNull: true);
    infoEmail.validateEmail(JsonKeys.infoEmail, checkNull: sendEmail == true);
    ip.validateIp(JsonKeys.ip);
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.rebillId)
  final int rebillId;

  /// Получение покупателем уведомлений на электронную почту
  @JsonKey(name: JsonKeys.sendEmail)
  final bool? sendEmail;

  /// Электронная почта покупателя
  @JsonKey(name: JsonKeys.infoEmail)
  final String? infoEmail;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;
}
