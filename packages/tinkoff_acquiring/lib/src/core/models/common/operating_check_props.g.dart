// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operating_check_props.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperatingCheckProps _$OperatingCheckPropsFromJson(Map<String, dynamic> json) =>
    OperatingCheckProps(
      json['Name'] as String,
      json['Value'] as String,
      json['Timestamp'] as String,
    );

Map<String, dynamic> _$OperatingCheckPropsToJson(
        OperatingCheckProps instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Value': instance.value,
      'Timestamp': instance.timestamp,
    };
