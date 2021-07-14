// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receipt _$ReceiptFromJson(Map<String, dynamic> json) => Receipt(
      taxation: _$enumDecode(_$TaxationEnumMap, json['Taxation']),
      items: (json['Items'] as List<dynamic>)
          .map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['Email'] as String?,
      phone: json['Phone'] as String?,
      emailCompany: json['EmailCompany'] as String?,
    );

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
  val['Taxation'] = _$TaxationEnumMap[instance.taxation];
  val['Items'] = instance.items;
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$TaxationEnumMap = {
  Taxation.osn: 'osn',
  Taxation.usnIncome: 'usn_income',
  Taxation.usnIncomeOutcome: 'usn_income_outcome',
  Taxation.patent: 'patent',
  Taxation.envd: 'envd',
  Taxation.esn: 'esn',
};
