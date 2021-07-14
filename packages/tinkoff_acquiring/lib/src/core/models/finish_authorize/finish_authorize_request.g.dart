// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_authorize_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishAuthorizeRequest _$FinishAuthorizeRequestFromJson(
        Map<String, dynamic> json) =>
    FinishAuthorizeRequest(
      paymentId: json['PaymentId'] as int,
      cardData: json['CardData'] as String?,
      encryptedPaymentData: json['EncryptedPaymentData'] as String?,
      amount: json['Amount'] as int?,
      data: (json['DATA'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      infoEmail: json['InfoEmail'] as String?,
      ip: json['IP'] as String?,
      phone: json['Phone'] as String?,
      sendEmail: json['SendEmail'] as bool?,
      route: _$enumDecodeNullable(_$RouteEnumMap, json['Route']),
      source: _$enumDecodeNullable(_$SourceEnumMap, json['Source']),
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$FinishAuthorizeRequestToJson(
    FinishAuthorizeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  writeNotNull('CardData', instance.cardData);
  writeNotNull('EncryptedPaymentData', instance.encryptedPaymentData);
  writeNotNull('Amount', instance.amount);
  writeNotNull('DATA', instance.data);
  writeNotNull('InfoEmail', instance.infoEmail);
  writeNotNull('IP', instance.ip);
  val['PaymentId'] = instance.paymentId;
  writeNotNull('Phone', instance.phone);
  writeNotNull('SendEmail', instance.sendEmail);
  writeNotNull('Route', _$RouteEnumMap[instance.route]);
  writeNotNull('Source', _$SourceEnumMap[instance.source]);
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$RouteEnumMap = {
  Route.acq: 'ACQ',
};

const _$SourceEnumMap = {
  Source.cards: 'Cards',
  Source.applePay: 'ApplePay',
  Source.googlePay: 'GooglePay',
};
