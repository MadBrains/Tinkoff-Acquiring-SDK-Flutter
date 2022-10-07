import 'package:json_annotation/json_annotation.dart';

/// Источник платежа.
///
/// Значение параметра зависит от параметра [Route]
enum Source {
  /// [ACQ] Cards – банковские карты
  @JsonValue('Cards')
  cards,

  /// [ACQ] ApplePay
  @JsonValue('ApplePay')
  applePay,

  /// [ACQ] GooglePay
  @JsonValue('GooglePay')
  googlePay,

  /// [ACQ] YandexPay
  @JsonValue('YandexPay')
  yandexPay,

  /// [MC] beeline
  @JsonValue('beeline')
  beeline,

  /// [MC] mts
  @JsonValue('mts')
  mts,

  /// [MC] tele2
  @JsonValue('tele2')
  tele2,

  /// [MC] megafon
  @JsonValue('megafon')
  megafon,

  /// [EINV] envoicing
  @JsonValue('envoicing')
  envoicing,

  /// [WM] webmoney
  @JsonValue('webmoney')
  webmoney,
}
