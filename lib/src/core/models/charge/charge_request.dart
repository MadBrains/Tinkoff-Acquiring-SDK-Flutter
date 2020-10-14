import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../base/acquiring_request.dart';
import '../../utils/extensions.dart';

part 'charge_request.g.dart';

/// Метод осуществляет автоплатеж.
///
/// Всегда работает по типу одностадийной оплаты:
/// во время выполнения метода на Notification URL будет отправлен синхронный запрос,
/// на который требуется корректный ответ.
///
/// [ChargeRequest](https://oplata.tinkoff.ru/develop/api/autopayments/charge-request/)
@JsonSerializable(includeIfNull: false)
class ChargeRequest extends AcquiringRequest {
  /// Создает экземпляр метода автоплатежа
  ChargeRequest(
    this.paymentId,
    this.rebillId, {
    this.sendEmail,
    this.infoEmail,
    this.ip,
    String signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory ChargeRequest.fromJson(Map<String, dynamic> json) =>
      _$ChargeRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.charge;

  @override
  Map<String, dynamic> toJson() => _$ChargeRequestToJson(this);

  @override
  ChargeRequest copyWith({
    int paymentId,
    int rebillId,
    bool sendEmail,
    String infoEmail,
    String ip,
    String signToken,
  }) {
    return ChargeRequest(
      paymentId ?? this.paymentId,
      rebillId ?? this.rebillId,
      sendEmail: sendEmail ?? this.sendEmail,
      infoEmail: infoEmail ?? this.infoEmail,
      ip: ip ?? this.ip,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(paymentId.length <= 20);
    assert(rebillId.length <= 20);

    if (sendEmail == true) {
      final bool match =
          RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
              .hasMatch(infoEmail ?? '');
      assert(infoEmail != null && infoEmail.length <= 100 && match);
    }

    if (ip != null) {
      assert(ip.length >= 7 && ip.length <= 45);
    }
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.rebillId)
  final int rebillId;

  /// Получение покупателем уведомлений на электронную почту
  @JsonKey(name: JsonKeys.sendEmail)
  final bool sendEmail;

  /// Электронная почта покупателя
  @JsonKey(name: JsonKeys.infoEmail)
  final String infoEmail;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String ip;
}
