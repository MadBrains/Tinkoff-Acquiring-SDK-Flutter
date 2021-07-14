// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_static_qr_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStaticQrRequest _$GetStaticQrRequestFromJson(Map<String, dynamic> json) =>
    GetStaticQrRequest(
      dataType: _$enumDecodeNullable(_$DataTypeEnumMap, json['DataType']) ??
          DataType.payload,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$GetStaticQrRequestToJson(GetStaticQrRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  writeNotNull('DataType', _$DataTypeEnumMap[instance.dataType]);
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

const _$DataTypeEnumMap = {
  DataType.payload: 'PAYLOAD',
  DataType.image: 'IMAGE',
};
