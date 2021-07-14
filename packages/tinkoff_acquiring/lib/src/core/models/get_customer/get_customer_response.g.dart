// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerResponse _$GetCustomerResponseFromJson(Map<String, dynamic> json) =>
    GetCustomerResponse(
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      customerKey: json['CustomerKey'] as String?,
      email: json['Email'] as String?,
      phone: json['Phone'] as String?,
    );

Map<String, dynamic> _$GetCustomerResponseToJson(
        GetCustomerResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'CustomerKey': instance.customerKey,
      'Email': instance.email,
      'Phone': instance.phone,
    };
