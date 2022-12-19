// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sectoral_check_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectoralCheckProps _$SectoralCheckPropsFromJson(Map<String, dynamic> json) =>
    SectoralCheckProps(
      json['FederalId'] as String,
      json['Date'] as String,
      json['Number'] as String,
      json['Value'] as String,
    );

Map<String, dynamic> _$SectoralCheckPropsToJson(SectoralCheckProps instance) =>
    <String, dynamic>{
      'FederalId': instance.federalId,
      'Date': instance.date,
      'Number': instance.number,
      'Value': instance.value,
    };
