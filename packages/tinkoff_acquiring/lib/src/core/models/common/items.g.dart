// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) => Items.all(
      name: json['Name'] as String,
      price: json['Price'] as int,
      quantity: json['Quantity'] as int,
      amount: json['Amount'] as int,
      tax: $enumDecode(_$TaxEnumMap, json['Tax']),
      paymentMethod:
          $enumDecodeNullable(_$PaymentMethodEnumMap, json['PaymentMethod']),
      paymentObject:
          $enumDecodeNullable(_$PaymentObjectEnumMap, json['PaymentObject']),
      agentData: json['AgentData'] == null
          ? null
          : AgentData.fromJson(json['AgentData'] as Map<String, dynamic>),
      supplierInfo: json['SupplierInfo'] == null
          ? null
          : SupplierInfo.fromJson(json['SupplierInfo'] as Map<String, dynamic>),
      ean13: json['Ean13'] as String?,
      shopCode: json['ShopCode'] as String?,
      userData: json['UserData'] as String?,
      excise: json['Excise'] as int?,
      countryCode: json['CountryCode'] as String?,
      declarationNumber: json['DeclarationNumber'] as String?,
      measurementUnit: json['MeasurementUnit'] as String?,
      markProcessingMode: json['MarkProcessingMode'] as String?,
      markCode: json['MarkCode'] == null
          ? null
          : MarkCode.fromJson(json['MarkCode'] as Map<String, dynamic>),
      markQuantity: json['MarkQuantity'] == null
          ? null
          : MarkQuantity.fromJson(json['MarkQuantity'] as Map<String, dynamic>),
      sectoralItemProps: (json['SectoralItemProps'] as List<dynamic>?)
          ?.map((e) => SectoralItemProps.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) {
  final val = <String, dynamic>{
    'Name': instance.name,
    'Quantity': instance.quantity,
    'Amount': instance.amount,
    'Price': instance.price,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PaymentMethod', _$PaymentMethodEnumMap[instance.paymentMethod]);
  writeNotNull('PaymentObject', _$PaymentObjectEnumMap[instance.paymentObject]);
  val['Tax'] = _$TaxEnumMap[instance.tax]!;
  writeNotNull('AgentData', instance.agentData);
  writeNotNull('SupplierInfo', instance.supplierInfo);
  writeNotNull('Ean13', instance.ean13);
  writeNotNull('ShopCode', instance.shopCode);
  writeNotNull('UserData', instance.userData);
  writeNotNull('Excise', instance.excise);
  writeNotNull('CountryCode', instance.countryCode);
  writeNotNull('DeclarationNumber', instance.declarationNumber);
  writeNotNull('MeasurementUnit', instance.measurementUnit);
  writeNotNull('MarkProcessingMode', instance.markProcessingMode);
  writeNotNull('MarkCode', instance.markCode);
  writeNotNull('MarkQuantity', instance.markQuantity);
  writeNotNull('SectoralItemProps', instance.sectoralItemProps);
  return val;
}

const _$TaxEnumMap = {
  Tax.none: 'none',
  Tax.vat0: 'vat0',
  Tax.vat10: 'vat10',
  Tax.vat20: 'vat20',
  Tax.vat110: 'vat110',
  Tax.vat120: 'vat120',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.fullPayment: 'full_payment',
  PaymentMethod.fullPrepayment: 'full_prepayment',
  PaymentMethod.prepayment: 'prepayment',
  PaymentMethod.advance: 'advance',
  PaymentMethod.partialPayment: 'partial_payment',
  PaymentMethod.credit: 'credit',
  PaymentMethod.creditPayment: 'credit_payment',
};

const _$PaymentObjectEnumMap = {
  PaymentObject.commodity: 'commodity',
  PaymentObject.excise: 'excise',
  PaymentObject.job: 'job',
  PaymentObject.service: 'service',
  PaymentObject.gamblingBet: 'gambling_bet',
  PaymentObject.gamblingPrize: 'gambling_prize',
  PaymentObject.lottery: 'lottery',
  PaymentObject.lotteryPrize: 'lottery_prize',
  PaymentObject.intellectualActivity: 'intellectual_activity',
  PaymentObject.payment: 'payment',
  PaymentObject.agentCommission: 'agent_commission',
  PaymentObject.composite: 'composite',
  PaymentObject.another: 'another',
  PaymentObject.contribution: 'contribution',
  PaymentObject.propertyRights: 'property_rights',
  PaymentObject.unrealization: 'unrealization',
  PaymentObject.taxReduction: 'tax_reduction',
  PaymentObject.tradeFee: 'trade_fee',
  PaymentObject.resortTax: 'resort_tax',
  PaymentObject.pledge: 'pledge',
  PaymentObject.incomeDecrease: 'income_decrease',
  PaymentObject.iePensionInsuranceWithoutPayments:
      'ie_pension_insurance_without_payments',
  PaymentObject.iePensionInsuranceWithPayments:
      'ie_pension_insurance_with_payments',
  PaymentObject.ieMedicalInsuranceWithoutPayments:
      'ie_medical_insurance_without_payments',
  PaymentObject.ieMedicalInsuranceWithPayments:
      'ie_medical_insurance_with_payments',
  PaymentObject.socialInsurance: 'social_insurance',
  PaymentObject.casinoChips: 'casino_chips',
  PaymentObject.agentPayment: 'agent_payment',
  PaymentObject.excisableGoodsWithoutMarkingCode:
      'excisable_goods_without_marking_code',
  PaymentObject.excisableGoodsWithMarkingCode:
      'excisable_goods_with_marking_code',
  PaymentObject.goodsWithoutMarkingCode: 'goods_without_marking_code',
  PaymentObject.goodsWithMarkingCode: 'goods_with_marking_code',
};
