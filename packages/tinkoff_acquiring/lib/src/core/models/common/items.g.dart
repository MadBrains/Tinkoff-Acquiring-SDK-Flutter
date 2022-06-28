// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      name: json['Name'] as String,
      quantity: json['Quantity'] as String,
      amount: json['Amount'] as String,
      price: json['Price'] as String,
      tax: $enumDecode(_$TaxEnumMap, json['Tax']),
      paymentMethod:
          $enumDecodeNullable(_$PaymentMethodEnumMap, json['PaymentMethod']),
      paymentObject:
          $enumDecodeNullable(_$PaymentObjectEnumMap, json['PaymentObject']),
      ean13: json['Ean13'] as String?,
      shopCode: json['ShopCode'] as String?,
      agentData: json['AgentData'] == null
          ? null
          : AgentData.fromJson(json['AgentData'] as Map<String, dynamic>),
      supplierInfo: json['SupplierInfo'] == null
          ? null
          : SupplierInfo.fromJson(json['SupplierInfo'] as Map<String, dynamic>),
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
  val['Tax'] = _$TaxEnumMap[instance.tax];
  writeNotNull('Ean13', instance.ean13);
  writeNotNull('ShopCode', instance.shopCode);
  writeNotNull('AgentData', instance.agentData);
  writeNotNull('SupplierInfo', instance.supplierInfo);
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
  PaymentObject.intellectualActivity: 'intellectualActivity',
  PaymentObject.payment: 'payment',
  PaymentObject.agentCommission: 'agentCommission',
  PaymentObject.composite: 'composite',
  PaymentObject.another: 'another',
};
