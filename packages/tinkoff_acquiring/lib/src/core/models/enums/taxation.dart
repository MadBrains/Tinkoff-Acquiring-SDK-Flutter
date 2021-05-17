import 'package:json_annotation/json_annotation.dart';

/// Система налогообложения
enum Taxation {
  /// osn — общая
  @JsonValue('osn')
  osn,

  /// 2. usn_income — упрощенная (доходы)
  @JsonValue('usn_income')
  usnIncome,

  /// 3. usn_income_outcome — упрощенная (доходы минус расходы)
  @JsonValue('usn_income_outcome')
  usnIncomeOutcome,

  /// 4. patent — патентная
  @JsonValue('patent')
  patent,

  /// 5. envd — единый налог на вмененный доход
  @JsonValue('envd')
  envd,

  /// 5. esn — единый сельскохозяйственный налог
  @JsonValue('esn')
  esn,
}
