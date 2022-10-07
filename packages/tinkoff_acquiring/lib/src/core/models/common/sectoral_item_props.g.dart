// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sectoral_item_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectoralItemProps _$SectoralItemPropsFromJson(Map<String, dynamic> json) =>
    SectoralItemProps(
      federalId: json['FederalId'] as String,
      date: json['Date'] as String,
      number: json['Number'] as String,
      value: json['Value'] as String,
    );

Map<String, dynamic> _$SectoralItemPropsToJson(SectoralItemProps instance) =>
    <String, dynamic>{
      'FederalId': instance.federalId,
      'Date': instance.date,
      'Number': instance.number,
      'Value': instance.value,
    };
