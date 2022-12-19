import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_request.dart';
import '../common/receipt.dart';
import '../common/shops.dart';

part 'cancel_request.g.dart';

/// Метод отменяет платеж
///
/// В зависимости от статуса платежа переводит его в следующие состояния:
/// - NEW -> CANCELED
/// - AUTHORIZED -> REVERSED
/// - CONFIRMED -> PARTIAL_REFUNDED – если отмена не на полную сумму
/// - CONFIRMED -> REFUNDED – если отмена на полную сумму
///
/// \* в случае отмены статуса NEW поле Amount, даже если оно проставлено, игнорируется.
/// Отмена производится на полную сумму.
///
/// \** в случае полной отмены структура чека не передается.
/// В случае частичной отмены необходимо передавать те товары, которые нужно отменить.
///
/// [CancelRequest](https://www.tinkoff.ru/kassa/develop/api/payments/cancel-description/)
@JsonSerializable(includeIfNull: false)
class CancelRequest extends AcquiringRequest {
  /// Создает экземпляр метода по отмене платежа
  CancelRequest({
    required this.paymentId,
    this.ip,
    this.amount,
    this.receipt,
    this.shops,
    this.qrMemberId,
    String? signToken,
  }) : super(signToken);

  /// Преобразование json в модель
  factory CancelRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelRequestFromJson(json);

  @override
  String get apiMethod => ApiMethods.cancel;

  @override
  Map<String, dynamic> toJson() => _$CancelRequestToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.paymentId: paymentId,
        JsonKeys.amount: amount,
        JsonKeys.ip: ip,
        JsonKeys.receipt: receipt,
        JsonKeys.shops: shops,
      };

  @override
  CancelRequest copyWith({
    String? signToken,
    int? paymentId,
    int? amount,
    String? ip,
    Receipt? receipt,
    List<Shops>? shops,
  }) {
    return CancelRequest(
      signToken: signToken ?? this.signToken,
      paymentId: paymentId ?? this.paymentId,
      amount: amount ?? this.amount,
      ip: ip ?? this.ip,
      receipt: receipt ?? this.receipt,
      shops: shops ?? this.shops,
    );
  }

  @override
  void validate() {
    receipt?.validate();
    final List<Shops>? shops = this.shops;
    if (shops != null) {
      for (int i = 0; i < shops.length; i++) {
        shops[i].validate();
      }
    }

    paymentId.validateId(JsonKeys.paymentId, checkNull: true);
    amount.validateAmount(JsonKeys.amount);
    ip.validateIp(JsonKeys.ip);
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

  /// Данные чека.
  ///
  /// См. Структура объекта [Receipt]
  ///
  /// Имеет приоритет над данными, переданными в методе `Init`
  @JsonKey(name: JsonKeys.receipt)
  final Receipt? receipt;

  /// Массив объектов с данными Маркетплейса
  ///
  /// Имеет приоритет над данными, переданными в методе `Init`
  @JsonKey(name: JsonKeys.shops)
  final List<Shops>? shops;

  /// Код банка в классификации СБП, в который необходимо выполнить возврат
  ///
  /// См параметр [memberId] в Методе [QrMembersList]
  @JsonKey(name: JsonKeys.qrMemberId)
  final String? qrMemberId;
}
