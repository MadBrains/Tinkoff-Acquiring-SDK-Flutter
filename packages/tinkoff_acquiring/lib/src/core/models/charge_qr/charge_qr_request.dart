import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';

part 'charge_qr_request.g.dart';

/// Проведение платежа по привязанному счету по QR через СБП.
///
/// Для возможности его использования Покупатель должен совершить успешную привязку счета с помощью метода [AddAccountQr].
/// После вызова метода будет отправлена нотификация на `Notification URL` о привязке счета, в которой будет указан `AccountToken`.
///
/// Для совершения платежа по привязанному счета Продавец должен вызвать метод [Init],
/// в котором поля `Recurrent= Y` и `DATA= {“QR”:“true”}`, а затем вызвать метод [ChargeQr]
/// для оплаты по тем же самым реквизитам и передать параметр `AccountToken`, полученный после привязки счета по QR в нотификации.
///
/// [ChargeQrRequest](https://www.tinkoff.ru/kassa/develop/api/payments-sbp/chargeqr-request/)
@JsonSerializable(includeIfNull: false)
class ChargeQrRequest extends AcquiringRequest {
  /// Создает экземпляр метода проведения платежа по привязанному счету по QR через СБП.
  ChargeQrRequest({
    required this.paymentId,
    required this.accountToken,
    this.ip,
    this.sendEmail,
    this.infoEmail,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory ChargeQrRequest.fromJson(Map<String, dynamic> json) =>
      _$ChargeQrRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.chargeQr;

  @override
  Map<String, dynamic> toJson() => _$ChargeQrRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.accountToken: accountToken,
        JsonKeys.sendEmail: sendEmail,
        JsonKeys.infoEmail: infoEmail,
        JsonKeys.ip: ip,
      };

  @override
  ChargeQrRequest copyWith({
    int? paymentId,
    String? accountToken,
    bool? sendEmail,
    String? infoEmail,
    String? ip,
    String? signToken,
  }) {
    return ChargeQrRequest(
      paymentId: paymentId ?? this.paymentId,
      accountToken: accountToken ?? this.accountToken,
      sendEmail: sendEmail ?? this.sendEmail,
      infoEmail: infoEmail ?? this.infoEmail,
      ip: ip ?? this.ip,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    paymentId.validateId(JsonKeys.paymentId, checkNull: true);
    infoEmail.validateEmail(JsonKeys.infoEmail, checkNull: sendEmail == true);
    ip.validateIp(JsonKeys.ip);
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;

  /// Идентификатор привязки счета, назначаемый Банком Плательщика
  @JsonKey(name: JsonKeys.accountToken)
  final String accountToken;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;

  /// Получение покупателем уведомлений на электронную почту
  @JsonKey(name: JsonKeys.sendEmail)
  final bool? sendEmail;

  /// Электронная почта покупателя
  @JsonKey(name: JsonKeys.infoEmail)
  final String? infoEmail;
}
