// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveCustomerResponse _$RemoveCustomerResponseFromJson(
        Map<String, dynamic> json) =>
    RemoveCustomerResponse(
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      customerKey: json['CustomerKey'] as String?,
    );

Map<String, dynamic> _$RemoveCustomerResponseToJson(
        RemoveCustomerResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'CustomerKey': instance.customerKey,
    };
