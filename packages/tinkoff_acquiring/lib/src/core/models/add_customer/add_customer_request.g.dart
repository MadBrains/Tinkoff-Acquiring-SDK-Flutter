// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCustomerRequest _$AddCustomerRequestFromJson(Map<String, dynamic> json) =>
    AddCustomerRequest(
      customerKey: json['CustomerKey'] as String,
      email: json['Email'] as String?,
      phone: json['Phone'] as String?,
      ip: json['IP'] as String?,
      signToken: json['Token'] as String?,
    );

Map<String, dynamic> _$AddCustomerRequestToJson(AddCustomerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Token', instance.signToken);
  val['CustomerKey'] = instance.customerKey;
  writeNotNull('Email', instance.email);
  writeNotNull('Phone', instance.phone);
  writeNotNull('IP', instance.ip);
  return val;
}
