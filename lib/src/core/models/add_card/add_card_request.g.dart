// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCardRequest _$AddCardRequestFromJson(Map<String, dynamic> json) {
  return AddCardRequest(
    json['CustomerKey'] as String,
    checkType: _$enumDecodeNullable(_$CheckTypeEnumMap, json['CheckType']),
    description: json['Description'] as String,
    payForm: json['PayForm'] as String,
    ip: json['IP'] as String,
    signToken: json['Token'] as String,
  );
}

Map<String, dynamic> _$AddCardRequestToJson(AddCardRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  writeNotNull('CustomerKey', instance.customerKey);
  writeNotNull('CheckType', _$CheckTypeEnumMap[instance.checkType]);
  writeNotNull('Description', instance.description);
  writeNotNull('PayForm', instance.payForm);
  writeNotNull('IP', instance.ip);
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

const _$CheckTypeEnumMap = {
  CheckType.no: 'NO',
  CheckType.hold: 'HOLD',
  CheckType.threeDS: '3DS',
  CheckType.threeDSHold: '3DSHOLD',
};
