import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../../../utils/extensions.dart';
import '../base/acquiring_request.dart';

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
  ChargeRequest({
    required this.paymentId,
    required this.rebillId,
    this.sendEmail,
    this.infoEmail,
    this.ip,
    String? signToken,
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
    assert(paymentId.length <= 20);
    assert(rebillId.length <= 20);

    final bool? _sendEmail = sendEmail;
    final String? _infoEmail = infoEmail;
    if (_sendEmail == true) {
      final bool match =
          RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
              .hasMatch(_infoEmail ?? '');
      assert(_infoEmail != null && _infoEmail.length <= 100 && match);
    }

    final String? _ip = ip;
    if (_ip != null) {
      assert(_ip.length >= 7 && _ip.length <= 45);
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
  final bool? sendEmail;

  /// Электронная почта покупателя
  @JsonKey(name: JsonKeys.infoEmail)
  final String? infoEmail;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;
}
