// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitRequest _$InitRequestFromJson(Map<String, dynamic> json) {
  return InitRequest(
    json['OrderId'] as String,
    amount: json['Amount'] as int,
    ip: json['IP'] as String,
    description: json['Description'] as String,
    language: _$enumDecodeNullable(_$LanguageEnumMap, json['Language']),
    recurrent: json['Recurrent'] as String,
    customerKey: json['CustomerKey'] as String,
    redirectDueDate: json['RedirectDueDate'] as String,
    notificationUrl: json['NotificationUrl'] as String,
    successUrl: json['SuccessUrl'] as String,
    failUrl: json['FailUrl'] as String,
    payType: _$enumDecodeNullable(_$PayTypeEnumMap, json['PayType']),
    receipt: json['Receipt'] == null
        ? null
        : Receipt.fromJson(json['Receipt'] as Map<String, dynamic>),
    data: (json['DATA'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    signToken: json['Token'] as String,
  );
}

Map<String, dynamic> _$InitRequestToJson(InitRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  writeNotNull('Amount', instance.amount);
  writeNotNull('OrderId', instance.orderId);
  writeNotNull('IP', instance.ip);
  writeNotNull('Description', instance.description);
  writeNotNull('Language', _$LanguageEnumMap[instance.language]);
  writeNotNull('Recurrent', instance.recurrent);
  writeNotNull('CustomerKey', instance.customerKey);
  writeNotNull('RedirectDueDate', instance.redirectDueDate);
  writeNotNull('NotificationUrl', instance.notificationUrl);
  writeNotNull('SuccessUrl', instance.successUrl);
  writeNotNull('FailUrl', instance.failUrl);
  writeNotNull('PayType', _$PayTypeEnumMap[instance.payType]);
  writeNotNull('Receipt', instance.receipt);
  writeNotNull('DATA', instance.data);
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

const _$LanguageEnumMap = {
  Language.ru: 'ru',
  Language.en: 'en',
};

const _$PayTypeEnumMap = {
  PayType.one: 'O',
  PayType.two: 'T',
};
