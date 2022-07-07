// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_account_qr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAccountQrResponse _$AddAccountQrResponseFromJson(
        Map<String, dynamic> json) =>
    AddAccountQrResponse(
      status: $enumDecodeNullable(_$StatusEnumMap, json['Status'],
          unknownValue: Status.notExist),
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      dataType: $enumDecodeNullable(_$DataTypeEnumMap, json['Data'],
          unknownValue: DataType.notExist),
      requestKey: json['RequestKey'] as String?,
    );

Map<String, dynamic> _$AddAccountQrResponseToJson(
        AddAccountQrResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Status': _$StatusEnumMap[instance.status],
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'Data': _$DataTypeEnumMap[instance.dataType],
      'RequestKey': instance.requestKey,
    };

const _$StatusEnumMap = {
  Status.notExist: 'notExist',
  Status.newest: 'NEW',
  Status.formShowed: 'FORM_SHOWED',
  Status.deadlineExpired: 'DEADLINE_EXPIRED',
  Status.canceled: 'CANCELED',
  Status.preAuthorizing: 'PREAUTHORIZING',
  Status.authorizing: 'AUTHORIZING',
  Status.authFail: 'AUTH_FAIL',
  Status.rejected: 'REJECTED',
  Status.threeDsChecking: '3DS_CHECKING',
  Status.threeDsChecked: '3DS_CHECKED',
  Status.payChecked: 'PAY_CHECKING',
  Status.authorized: 'AUTHORIZED',
  Status.reversing: 'REVERSING',
  Status.partialReversed: 'PARTIAL_REVERSED',
  Status.reversed: 'REVERSED',
  Status.confirming: 'CONFIRMING',
  Status.confirmChecking: 'CONFIRM_CHECKING',
  Status.confirmed: 'CONFIRMED',
  Status.refunding: 'REFUNDING',
  Status.asyncRefunding: 'ASYNC_REFUNDING',
  Status.partialRefunded: 'PARTIAL_REFUNDED',
  Status.refunded: 'REFUNDED',
  Status.unknown: 'UNKNOWN',
  Status.loopChecking: 'LOOP_CHECKING',
  Status.completed: 'COMPLETED',
  Status.proccesing: 'PROCCESING',
  Status.active: 'ACTIVE',
  Status.inacitve: 'INACITVE',
};

const _$DataTypeEnumMap = {
  DataType.notExist: 'notExist',
  DataType.payload: 'PAYLOAD',
  DataType.image: 'IMAGE',
};
