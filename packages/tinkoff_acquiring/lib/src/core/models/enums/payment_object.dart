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
  @JsonValue('intellectual_activity')
  intellectualActivity,

  /// payment — платеж
  @JsonValue('payment')
  payment,

  /// agent_commission — агентское вознаграждение
  @JsonValue('agent_commission')
  agentCommission,

  /// composite — составной предмет расчета, только для ФФД 1.05
  @JsonValue('composite')
  composite,

  /// another — иной предмет расчета
  @JsonValue('another')
  another,

  /// contribution — выплата, только для ФФД 1.2
  @JsonValue('contribution')
  contribution,

  /// property_rights — имущественное право, только для ФФД 1.2
  @JsonValue('property_rights')
  propertyRights,

  /// unrealization — внереализационный доход, только для ФФД 1.2
  @JsonValue('unrealization')
  unrealization,

  /// tax_reduction — иные платежи и взносы, только для ФФД 1.2
  @JsonValue('tax_reduction')
  taxReduction,

  /// trade_fee — торговый сбор, только для ФФД 1.2
  @JsonValue('trade_fee')
  tradeFee,

  /// resort_tax — курортный сбор, только для ФФД 1.2
  @JsonValue('resort_tax')
  resortTax,

  /// pledge — залог, только для ФФД 1.2
  @JsonValue('pledge')
  pledge,

  /// income_decrease — расход, только для ФФД 1.2
  @JsonValue('income_decrease')
  incomeDecrease,

  /// ie_pension_insurance_without_payments — взносы на ОПС ИП, только для ФФД 1.2
  @JsonValue('ie_pension_insurance_without_payments')
  iePensionInsuranceWithoutPayments,

  /// ie_pension_insurance_with_payments — взносы на ОПС, только для ФФД 1.2
  @JsonValue('ie_pension_insurance_with_payments')
  iePensionInsuranceWithPayments,

  /// ie_medical_insurance_without_payments — взносы на ОМС ИП, только для ФФД 1.2
  @JsonValue('ie_medical_insurance_without_payments')
  ieMedicalInsuranceWithoutPayments,

  /// ie_medical_insurance_with_payments — взносы на ОМС, только для ФФД 1.2
  @JsonValue('ie_medical_insurance_with_payments')
  ieMedicalInsuranceWithPayments,

  /// social_insurance — взносы на ОСС, только для ФФД 1.2
  @JsonValue('social_insurance')
  socialInsurance,

  /// casino_chips — платеж казино, только для ФФД 1.2
  @JsonValue('casino_chips')
  casinoChips,

  /// agent_payment — выдача ДС, только для ФФД 1.2
  @JsonValue('agent_payment')
  agentPayment,

  /// excisable_goods_without_marking_code — АТНМ, только для ФФД 1.2
  @JsonValue('excisable_goods_without_marking_code')
  excisableGoodsWithoutMarkingCode,

  /// excisable_goods_with_marking_code — АТМ, только для ФФД 1.2
  @JsonValue('excisable_goods_with_marking_code')
  excisableGoodsWithMarkingCode,

  /// goods_without_marking_code — ТНМ, только для ФФД 1.2
  @JsonValue('goods_without_marking_code')
  goodsWithoutMarkingCode,

  /// goods_with_marking_code — ТМ, только для ФФД 1.2
  @JsonValue('goods_with_marking_code')
  goodsWithMarkingCode,
}
