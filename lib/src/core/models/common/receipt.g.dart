// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receipt _$ReceiptFromJson(Map<String, dynamic> json) {
  return Receipt(
    _$enumDecodeNullable(_$TaxationEnumMap, json['Taxation']),
    (json['Items'] as List)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    email: json['Email'] as String,
    phone: json['Phone'] as String,
    emailCompany: json['EmailCompany'] as String,
  );
}

Map<String, dynamic> _$ReceiptToJson(Receipt instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Email', instance.email);
  writeNotNull('Phone', instance.phone);
  writeNotNull('EmailCompany', instance.emailCompany);
  writeNotNull('Taxation', _$TaxationEnumMap[instance.taxation]);
  writeNotNull('Items', instance.items);
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

const _$TaxationEnumMap = {
  Taxation.osn: 'osn',
  Taxation.usnIncome: 'usn_income',
  Taxation.usnIncomeOutcome: 'usn_income_outcome',
  Taxation.patent: 'patent',
  Taxation.envd: 'envd',
  Taxation.esn: 'esn',
};
