// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitRequest _$InitRequestFromJson(Map<String, dynamic> json) => InitRequest(
      orderId: json['OrderId'] as String,
      amount: json['Amount'] as int?,
      ip: json['IP'] as String?,
      description: json['Description'] as String?,
      currency: json['Currency'] as int?,
      customerKey: json['CustomerKey'] as String?,
      recurrent: json['Recurrent'] as String?,
      language: $enumDecodeNullable(_$LanguageEnumMap, json['Language']),
      redirectDueDate: json['RedirectDueDate'] as String?,
      notificationUrl: json['NotificationURL'] as String?,
      successUrl: json['SuccessURL'] as String?,
      failUrl: json['FailURL'] as String?,
      payType: $enumDecodeNullable(_$PayTypeEnumMap, json['PayType']),
      receipt: json['Receipt'] == null
          ? null
          : Receipt.fromJson(json['Receipt'] as Map<String, dynamic>),
      data: (json['DATA'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      shops: (json['Shops'] as List<dynamic>?)
          ?.map((e) => Shops.fromJson(e as Map<String, dynamic>))
          .toList(),
      descriptor: json['Descriptor'] as String?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$InitRequestToJson(InitRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  writeNotNull('Amount', instance.amount);
  val['OrderId'] = instance.orderId;
  writeNotNull('IP', instance.ip);
  writeNotNull('Description', instance.description);
  writeNotNull('Currency', instance.currency);
  writeNotNull('Language', _$LanguageEnumMap[instance.language]);
  writeNotNull('Recurrent', instance.recurrent);
  writeNotNull('CustomerKey', instance.customerKey);
  writeNotNull('RedirectDueDate', instance.redirectDueDate);
  writeNotNull('NotificationURL', instance.notificationUrl);
  writeNotNull('SuccessURL', instance.successUrl);
  writeNotNull('FailURL', instance.failUrl);
  writeNotNull('PayType', _$PayTypeEnumMap[instance.payType]);
  writeNotNull('Receipt', instance.receipt);
  writeNotNull('DATA', instance.data);
  writeNotNull('Shops', instance.shops);
  writeNotNull('Descriptor', instance.descriptor);
  return val;
}

const _$LanguageEnumMap = {
  Language.ru: 'ru',
  Language.en: 'en',
};

const _$PayTypeEnumMap = {
  PayType.one: 'O',
  PayType.two: 'T',
};
