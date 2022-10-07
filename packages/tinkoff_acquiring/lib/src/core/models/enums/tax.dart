import 'package:json_annotation/json_annotation.dart';

/// Ставка НДС
enum Tax {
  /// none — без НДС
  @JsonValue('none')
  none,

  /// vat0 — 0%
  @JsonValue('vat0')
  vat0,

  /// vat10 — 10%
  @JsonValue('vat10')
  vat10,

  /// vat18 — 18%
  @JsonValue('vat18')
  vat18,

  /// vat20 — 20%
  @JsonValue('vat20')
  vat20,

  /// vat110 — 10/110
  @JsonValue('vat110')
  vat110,

  /// vat118 — 18/118
  @JsonValue('vat118')
  vat118,

  /// vat120 — 20/120
  @JsonValue('vat120')
  vat120,
}
