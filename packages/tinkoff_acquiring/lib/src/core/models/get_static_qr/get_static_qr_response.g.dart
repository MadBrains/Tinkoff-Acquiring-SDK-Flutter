// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_static_qr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStaticQrResponse _$GetStaticQrResponseFromJson(Map<String, dynamic> json) =>
    GetStaticQrResponse(
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      data: json['Data'] as String?,
    );

Map<String, dynamic> _$GetStaticQrResponseToJson(
        GetStaticQrResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'Data': instance.data,
    };
