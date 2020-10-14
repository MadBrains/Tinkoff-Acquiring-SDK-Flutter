import 'package:json_annotation/json_annotation.dart';

/// Признак предмета расчета
enum PaymentObject {
  /// commodity — товар
  @JsonValue('commodity')
  commodity,

  /// excise — подакцизный товар
  @JsonValue('excise')
  excise,

  /// job — работа
  @JsonValue('job')
  job,

  /// service — услуга
  @JsonValue('service')
  service,

  /// gambling_bet — ставка азартной игры
  @JsonValue('gambling_bet')
  gamblingBet,

  /// gambling_prize — выигрыш азартной игры
  @JsonValue('gambling_prize')
  gamblingPrize,

  /// lottery — лотерейный билет
  @JsonValue('lottery')
  lottery,

  /// lottery_prize — выигрыш лотереи
  @JsonValue('lottery_prize')
  lotteryPrize,

  /// intellectual_activity — предоставление результатов интеллектуальной деятельности
  @JsonValue('intellectualActivity')
  intellectualActivity,

  /// payment — платеж
  @JsonValue('payment')
  payment,

  /// agent_commission — агентское вознаграждение
  @JsonValue('agentCommission')
  agentCommission,

  /// composite — составной предмет расчета
  @JsonValue('composite')
  composite,

  /// another — иной предмет расчета
  @JsonValue('another')
  another,
}
