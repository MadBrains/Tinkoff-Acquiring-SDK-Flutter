// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerRequest _$GetCustomerRequestFromJson(Map<String, dynamic> json) =>
    GetCustomerRequest(
      customerKey: json['CustomerKey'] as String,
      ip: json['IP'] as String?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$GetCustomerRequestToJson(GetCustomerRequest instance) {
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
