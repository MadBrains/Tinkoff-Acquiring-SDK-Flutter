import 'package:json_annotation/json_annotation.dart';

/// Признак агента.
enum AgentSign {
  /// bank_paying_agent – банковский платежный агент
  @JsonValue('bank_paying_agent')
  bankPayingAgent,

  /// bank_paying_subagent – банковский платежный субагент
  @JsonValue('bank_paying_subagent')
  bankPayingSubagent,

  /// paying_agent – платежный агент
  @JsonValue('paying_agent')
  payingAgent,

  /// paying_subagent – платежный субагент
  @JsonValue('paying_subagent')
  payingSubagent,

  /// attorney – поверенный
  @JsonValue('attorney')
  attorney,

  /// commission_agent – комиссионер
  @JsonValue('commission_agent')
  commissionAgent,

  /// another – другой тип агента
  @JsonValue('another')
  another,
}
