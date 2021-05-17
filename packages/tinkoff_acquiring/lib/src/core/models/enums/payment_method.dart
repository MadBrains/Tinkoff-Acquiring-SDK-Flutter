import 'package:json_annotation/json_annotation.dart';

/// Признак способа расчета
enum PaymentMethod {
  /// full_payment — полный расчет
  @JsonValue('full_payment')
  fullPayment,

  /// full_prepayment — предоплата 100%
  @JsonValue('full_prepayment')
  fullPrepayment,

  /// prepayment — предоплата
  @JsonValue('prepayment')
  prepayment,

  /// advance — аванс
  @JsonValue('advance')
  advance,

  /// partial_payment — частичный расчет и кредит
  @JsonValue('partial_payment')
  partialPayment,

  /// credit — передача в кредит
  @JsonValue('credit')
  credit,

  /// credit_payment — оплата кредита
  @JsonValue('credit_payment')
  creditPayment,
}
