import 'package:json_annotation/json_annotation.dart';

import '../base/acquiring_response.dart';
import '../common/order_payments.dart';
import '../enums/status.dart';

part 'check_order_response.g.dart';

/// Ответ от сервера на получение статуса платежа
///
/// [CheckOrderResponse](https://www.tinkoff.ru/kassa/develop/api/payments/CheckOrder-response/)
@JsonSerializable()
class CheckOrderResponse extends AcquiringResponse {
  /// Создает экземпляр ответа от сервера на получение статуса платежа
  CheckOrderResponse({
    Status? status,
    bool? success,
    String? errorCode,
    String? message,
    String? details,
    this.terminalKey,
    this.orderId,
    this.payments,
  }) : super(
          status: status,
          success: success,
          errorCode: errorCode,
          message: message,
          details: details,
        );

  /// Преобразование json в модель
  factory CheckOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckOrderResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CheckOrderResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.terminalKey: terminalKey,
        JsonKeys.orderId: orderId,
        JsonKeys.payments: payments,
      };

  /// Идентификатор терминала.
  /// Выдается продавцу банком при заведении терминала
  @JsonKey(name: JsonKeys.terminalKey)
  final String? terminalKey;

  /// Идентификатор заказа в системе продавца
  @JsonKey(name: JsonKeys.orderId)
  final String? orderId;

  /// Детали
  @JsonKey(name: JsonKeys.payments)
  final List<OrderPayments>? payments;
}
