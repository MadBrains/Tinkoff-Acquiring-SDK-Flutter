// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierInfo _$SupplierInfoFromJson(Map<String, dynamic> json) {
  return SupplierInfo(
    (json['Phones'] as List)?.map((e) => e as String)?.toList(),
    json['Name'] as String,
    json['Inn'] as String,
  );
}

Map<String, dynamic> _$SupplierInfoToJson(SupplierInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Phones', instance.phones);
  writeNotNull('Name', instance.name);
  writeNotNull('Inn', instance.inn);
  return val;
}
