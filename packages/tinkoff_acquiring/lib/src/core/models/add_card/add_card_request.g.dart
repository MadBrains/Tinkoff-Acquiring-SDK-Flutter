// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCardRequest _$AddCardRequestFromJson(Map<String, dynamic> json) =>
    AddCardRequest(
      customerKey: json['CustomerKey'] as String,
      checkType: _$enumDecodeNullable(_$CheckTypeEnumMap, json['CheckType']),
      description: json['Description'] as String?,
      payForm: json['PayForm'] as String?,
      ip: json['IP'] as String?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$AddCardRequestToJson(AddCardRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['CustomerKey'] = instance.customerKey;
  writeNotNull('CheckType', _$CheckTypeEnumMap[instance.checkType]);
  writeNotNull('Description', instance.description);
  writeNotNull('PayForm', instance.payForm);
  writeNotNull('IP', instance.ip);
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

const _$CheckTypeEnumMap = {
  CheckType.no: 'NO',
  CheckType.hold: 'HOLD',
  CheckType.threeDS: '3DS',
  CheckType.threeDSHold: '3DSHOLD',
};
