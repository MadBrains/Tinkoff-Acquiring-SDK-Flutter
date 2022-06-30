// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receipts _$ReceiptsFromJson(Map<String, dynamic> json) => Receipts(
      shopCode: json['ShopCode'] as String?,
      items: (json['Items'] as List<dynamic>)
          .map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxation: $enumDecode(_$TaxationEnumMap, json['Taxation']),
      email: json['Email'] as String?,
      phone: json['Phone'] as String?,
    );

Map<String, dynamic> _$ReceiptsToJson(Receipts instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ShopCode', instance.shopCode);
  val['Items'] = instance.items;
  writeNotNull('Email', instance.email);
  writeNotNull('Phone', instance.phone);
  val['Taxation'] = _$TaxationEnumMap[instance.taxation];
  return val;
}

const _$TaxationEnumMap = {
  Taxation.osn: 'osn',
  Taxation.usnIncome: 'usn_income',
  Taxation.usnIncomeOutcome: 'usn_income_outcome',
  Taxation.patent: 'patent',
  Taxation.envd: 'envd',
  Taxation.esn: 'esn',
};
