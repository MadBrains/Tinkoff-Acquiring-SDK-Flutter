// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCardResponse _$AddCardResponseFromJson(Map<String, dynamic> json) =>
    AddCardResponse(
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      customerKey: json['CustomerKey'] as String?,
      requestKey: json['RequestKey'] as String?,
      paymentURL: json['PaymentURL'] as String?,
    );

Map<String, dynamic> _$AddCardResponseToJson(AddCardResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'CustomerKey': instance.customerKey,
      'RequestKey': instance.requestKey,
      'PaymentURL': instance.paymentURL,
    };
