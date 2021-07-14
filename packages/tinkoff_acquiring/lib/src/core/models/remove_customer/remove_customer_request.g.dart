// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveCustomerRequest _$RemoveCustomerRequestFromJson(
        Map<String, dynamic> json) =>
    RemoveCustomerRequest(
      customerKey: json['CustomerKey'] as String,
      ip: json['IP'] as String?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$RemoveCustomerRequestToJson(
    RemoveCustomerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['CustomerKey'] = instance.customerKey;
  writeNotNull('IP', instance.ip);
  return val;
}
