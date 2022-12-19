// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkCode _$MarkCodeFromJson(Map<String, dynamic> json) => MarkCode(
      markCodeType: $enumDecode(_$MarkCodeTypeEnumMap, json['MarkCodeType']),
      value: json['Value'] as String,
    );

Map<String, dynamic> _$MarkCodeToJson(MarkCode instance) => <String, dynamic>{
      'MarkCodeType': _$MarkCodeTypeEnumMap[instance.markCodeType]!,
      'Value': instance.value,
    };

const _$MarkCodeTypeEnumMap = {
  MarkCodeType.unknown: 'Unknown',
  MarkCodeType.ean8: 'ean8',
  MarkCodeType.ean13: 'ean13',
  MarkCodeType.itf14: 'itf14',
  MarkCodeType.gs10: 'gs10',
  MarkCodeType.gs1m: 'gs1m',
  MarkCodeType.short: 'short',
  MarkCodeType.fur: 'fur',
  MarkCodeType.egais20: 'egais20',
  MarkCodeType.egais30: 'egais30',
};
