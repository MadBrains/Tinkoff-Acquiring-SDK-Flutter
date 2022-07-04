// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_account_qr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAccountQrResponse _$AddAccountQrResponseFromJson(
        Map<String, dynamic> json) =>
    AddAccountQrResponse(
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      dataType: $enumDecodeNullable(_$DataTypeEnumMap, json['Data']),
      requestKey: json['RequestKey'] as String?,
    );

Map<String, dynamic> _$AddAccountQrResponseToJson(
        AddAccountQrResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'Data': _$DataTypeEnumMap[instance.dataType],
      'RequestKey': instance.requestKey,
    };

const _$DataTypeEnumMap = {
  DataType.payload: 'PAYLOAD',
  DataType.image: 'IMAGE',
};
