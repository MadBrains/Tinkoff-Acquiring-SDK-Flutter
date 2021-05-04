import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../../../utils/extensions.dart';
import '../base/acquiring_request.dart';
import '../common/receipt.dart';

part 'confirm_request.g.dart';

/// Метод подтверждает платеж и списывает ранее заблокированные средства.
///
/// Используется при двухстадийной оплате. При одностадийной оплате вызывается автоматически.
/// Применим к платежу только в статусе `AUTHORIZED` и только один раз.
///
/// Сумма подтверждения не может быть больше заблокированной.
/// Если сумма подтверждения меньше заблокированной, будет выполнено частичное подтверждение.
///
/// [ConfirmRequest](https://oplata.tinkoff.ru/develop/api/payments/confirm-request/)
@JsonSerializable(includeIfNull: false)
class ConfirmRequest extends AcquiringRequest {
  /// Создает экземпляр метода подтверждения платежа
  ConfirmRequest({
    required this.paymentId,
    this.amount,
    this.ip,
    this.receipt,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory ConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.confirm;

  @override
  Map<String, dynamic> toJson() => _$ConfirmRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.amount: amount,
        JsonKeys.ip: ip,
        JsonKeys.receipt: receipt,
      };

  @override
  ConfirmRequest copyWith({
    int? paymentId,
    int? amount,
    String? ip,
    Receipt? receipt,
    String? signToken,
  }) {
    return ConfirmRequest(
      paymentId: paymentId ?? this.paymentId,
      amount: amount ?? this.amount,
      ip: ip ?? this.ip,
      receipt: receipt ?? this.receipt,
      signToken: signToken ?? this.signToken,
    );
  }

  @override
  void validate() {
    assert(paymentId.length <= 20);

    final int? _amount = amount;
    if (_amount != null) {
      assert(_amount.length <= 10);
    }

    final String? _ip = ip;
    if (_ip != null) {
      assert(_ip.length >= 7 && _ip.length <= 45);
    }
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;

  /// Сумма в копейках
  ///
  /// Пример: `140000` == `1400.00 рублей`
  @JsonKey(name: JsonKeys.amount)
  final int? amount;

  /// IP-адрес покупателя
  @JsonKey(name: JsonKeys.ip)
  final String? ip;

  /// Массив данных чека.
  ///
  /// См. Структура объекта [Receipt]
  ///
  /// Имеет приоритет над данными, переданными в методе `Init`
  @JsonKey(name: JsonKeys.receipt)
  final Receipt? receipt;
}
