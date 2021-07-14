// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_qr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQrResponse _$GetQrResponseFromJson(Map<String, dynamic> json) =>
    GetQrResponse(
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      paymentId: json['PaymentId'] as int?,
      orderId: json['OrderId'] as String?,
      data: json['Data'] as String?,
    );

Map<String, dynamic> _$GetQrResponseToJson(GetQrResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'PaymentId': instance.paymentId,
      'OrderId': instance.orderId,
      'Data': instance.data,
    };
