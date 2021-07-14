// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendResponse _$ResendResponseFromJson(Map<String, dynamic> json) =>
    ResendResponse(
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      count: json['Count'] as int?,
    );

Map<String, dynamic> _$ResendResponseToJson(ResendResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'Count': instance.count,
    };
