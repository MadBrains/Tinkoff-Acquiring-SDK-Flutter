import 'package:json_annotation/json_annotation.dart';

import '../base/base_request.dart';
import '../enums/status.dart';

part 'order_payments.g.dart';

/// Детали заказа
@JsonSerializable(includeIfNull: false)
class OrderPayments extends BaseRequest {
  /// Создает экземпляр обекта с деталими заказа
  OrderPayments({
    this.paymentId,
    this.amount,
    this.status,
    this.rrn,
    this.success,
    this.errorCode,
    this.message,
  });

  /// Преобразование json в модель
  factory OrderPayments.fromJson(Map<String, dynamic> json) =>
      _$OrderPaymentsFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.paymentId: paymentId,
        JsonKeys.amount: amount,
        JsonKeys.status: status,
        JsonKeys.rrn: rrn,
        JsonKeys.success: success,
        JsonKeys.errorCode: errorCode,
        JsonKeys.message: message,
      };

  @override
  Map<String, dynamic> toJson() => _$OrderPaymentsToJson(this);

  @override
  OrderPayments copyWith({
    String? paymentId,
    int? amount,
    Status? status,
    String? rrn,
    bool? success,
    String? errorCode,
    String? message,
  }) {
    return OrderPayments(
      paymentId: paymentId ?? this.paymentId,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      rrn: rrn ?? this.rrn,
      success: success ?? this.success,
      errorCode: errorCode ?? this.errorCode,
      message: message ?? this.message,
    );
  }

  @override
  void validate() {}

  /// Уникальный идентификатор транзакции в системе Банка
  @JsonKey(name: JsonKeys.paymentId)
  final String? paymentId;

  /// Сумма операции в копейках
  @JsonKey(name: JsonKeys.amount)
  final int? amount;

  /// Статус транзакции
  @JsonKey(name: JsonKeys.status)
  final Status? status;

  /// RRN операции
  @JsonKey(name: JsonKeys.rrn)
  final String? rrn;

  /// Успешность операции (true/false)
  @JsonKey(name: JsonKeys.success)
  final bool? success;

  /// Код ошибки, «0» - если успешно
  @JsonKey(name: JsonKeys.errorCode)
  final String? errorCode;

  /// Краткое описание ошибки
  @JsonKey(name: JsonKeys.message)
  final String? message;
}
