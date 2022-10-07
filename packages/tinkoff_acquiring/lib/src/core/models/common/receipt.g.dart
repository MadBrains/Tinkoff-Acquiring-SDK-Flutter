// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receipt _$ReceiptFromJson(Map<String, dynamic> json) => Receipt(
      taxation: $enumDecode(_$TaxationEnumMap, json['Taxation']),
      items: (json['Items'] as List<dynamic>)
          .map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      ffdVersion: json['FfdVersion'] as String,
      email: json['Email'] as String?,
      phone: json['Phone'] as String?,
      payments: json['Payments'] == null
          ? null
          : Payments.fromJson(json['Payments'] as Map<String, dynamic>),
      customer: json['Customer'] as String?,
      customerInn: json['CustomerInn'] as String?,
      clientInfo: json['ClientInfo'] == null
          ? null
          : ClientInfo.fromJson(json['ClientInfo'] as Map<String, dynamic>),
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
  val['Taxation'] = _$TaxationEnumMap[instance.taxation];
  val['Items'] = instance.items;
  writeNotNull('Payments', instance.payments);
  val['FfdVersion'] = instance.ffdVersion;
  writeNotNull('Customer', instance.customer);
  writeNotNull('CustomerInn', instance.customerInn);
  writeNotNull('ClientInfo', instance.clientInfo);
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
