// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    json['Name'] as String,
    json['Quantity'] as String,
    json['Amount'] as String,
    json['Price'] as String,
    _$enumDecodeNullable(_$TaxEnumMap, json['Tax']),
    paymentMethod:
        _$enumDecodeNullable(_$PaymentMethodEnumMap, json['PaymentMethod']),
    paymentObject:
        _$enumDecodeNullable(_$PaymentObjectEnumMap, json['PaymentObject']),
    ean13: json['Ean13'] as String,
    shopCode: json['ShopCode'] as String,
    agentData: json['AgentData'] == null
        ? null
        : AgentData.fromJson(json['AgentData'] as Map<String, dynamic>),
    supplierInfo: json['SupplierInfo'] == null
        ? null
        : SupplierInfo.fromJson(json['SupplierInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Quantity', instance.quantity);
  writeNotNull('Amount', instance.amount);
  writeNotNull('Price', instance.price);
  writeNotNull('PaymentMethod', _$PaymentMethodEnumMap[instance.paymentMethod]);
  writeNotNull('PaymentObject', _$PaymentObjectEnumMap[instance.paymentObject]);
  writeNotNull('Tax', _$TaxEnumMap[instance.tax]);
  writeNotNull('Ean13', instance.ean13);
  writeNotNull('ShopCode', instance.shopCode);
  writeNotNull('AgentData', instance.agentData);
  writeNotNull('SupplierInfo', instance.supplierInfo);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
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
