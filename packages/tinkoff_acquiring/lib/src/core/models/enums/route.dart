import 'package:json_annotation/json_annotation.dart';

/// Способ платежа.
enum Route {
  /// ACQ – для Apple Pay и/или Google Pay
  @JsonValue('ACQ')
  acq,
}
