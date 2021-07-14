// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierInfo _$SupplierInfoFromJson(Map<String, dynamic> json) => SupplierInfo(
      (json['Phones'] as List<dynamic>).map((e) => e as String).toList(),
      json['Name'] as String,
      json['Inn'] as String,
    );

Map<String, dynamic> _$SupplierInfoToJson(SupplierInfo instance) =>
    <String, dynamic>{
      'Phones': instance.phones,
      'Name': instance.name,
      'Inn': instance.inn,
    };
