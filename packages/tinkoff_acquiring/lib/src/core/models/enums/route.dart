import 'package:json_annotation/json_annotation.dart';

/// Способ платежа.
enum Route {
  /// ACQ – для Cards, Apple Pay и Google Pay
  @JsonValue('ACQ')
  acq,

  /// Mobile commerce
  @JsonValue('MC')
  mc,

  /// Envoicing
  @JsonValue('EINV')
  einv,

  /// WebMoney
  @JsonValue('WM')
  wm,
}
