import 'package:json_annotation/json_annotation.dart';

/// Источник платежа.
enum Source {
  /// Cards – банковские карты
  @JsonValue('Cards')
  cards,

  /// ApplePay
  @JsonValue('ApplePay')
  applePay,

  /// GooglePay
  @JsonValue('GooglePay')
  googlePay,
}
