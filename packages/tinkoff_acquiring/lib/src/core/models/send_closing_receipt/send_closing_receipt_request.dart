import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../../../utils/extensions.dart';
import '../base/acquiring_request.dart';
import '../common/receipt.dart';

part 'send_closing_receipt_request.g.dart';

/// Метод позволяет отправить закрывающий чек в кассу.
/// Условия работы метода:
/// 1. Закрывающий чек может быть отправлен если платежная сессия по первому чеку находится в статусе CONFIRMED.
/// 2. В платежной сессии был передан объект Receipt.
/// 3. В объекте Receipt был передан хотя бы один объект Receipt.Items.PaymentMethod = "full_prepayment" или "prepayment" или "advance"
///
/// [SendClosingReceiptRequest](https://www.tinkoff.ru/kassa/develop/api/payments/SendClosingReceipt-request/)
@JsonSerializable(includeIfNull: false)
class SendClosingReceiptRequest extends AcquiringRequest {
  /// Создает экземпляр метода по отправке закрывающего чека в кассу
  SendClosingReceiptRequest({
    required this.paymentId,
    required this.receipt,
    String? signToken,
  }) : super(signToken) {
    validate();
  }

  /// Преобразование json в модель
  factory SendClosingReceiptRequest.fromJson(Map<String, dynamic> json) =>
      _$SendClosingReceiptRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.sendClosingReceipt;

  @override
  Map<String, dynamic> toJson() => _$SendClosingReceiptRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.receipt: receipt,
      };

  @override
  SendClosingReceiptRequest copyWith({
    int? paymentId,
    Receipt? receipt,
  }) {
    return SendClosingReceiptRequest(
      paymentId: paymentId ?? this.paymentId,
      receipt: receipt ?? this.receipt,
    );
  }

  @override
  void validate() {
    assert(paymentId.length <= 20);
    receipt.validate();
  }

  /// Идентификатор платежа в системе банка
  @JsonKey(name: JsonKeys.paymentId)
  final int paymentId;

  /// Данные чека
  @JsonKey(name: JsonKeys.receipt)
  final Receipt receipt;
}
