// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shops _$ShopsFromJson(Map<String, dynamic> json) => Shops(
      shopCode: json['ShopCode'] as String,
      amount: json['Amount'] as int,
      name: json['Name'] as String?,
      fee: json['Fee'] as String?,
    );

Map<String, dynamic> _$ShopsToJson(Shops instance) {
  final val = <String, dynamic>{
    'ShopCode': instance.shopCode,
    'Amount': instance.amount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Fee', instance.fee);
  return val;
}
