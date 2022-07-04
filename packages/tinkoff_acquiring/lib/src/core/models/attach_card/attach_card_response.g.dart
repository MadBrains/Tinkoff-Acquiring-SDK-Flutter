// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attach_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachCardResponse _$AttachCardResponseFromJson(Map<String, dynamic> json) =>
    AttachCardResponse(
      status: $enumDecodeNullable(_$StatusEnumMap, json['Status']),
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      customerKey: json['CustomerKey'] as String?,
      requestKey: json['RequestKey'] as String?,
      rebillId: json['RebillId'] as int?,
      cardId: json['CardId'] as String?,
      acsUrl: json['ACSUrl'] as String?,
      md: json['MD'] as String?,
      paReq: json['PaReq'] as String?,
    );

Map<String, dynamic> _$AttachCardResponseToJson(AttachCardResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Status': _$StatusEnumMap[instance.status],
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'CustomerKey': instance.customerKey,
      'RequestKey': instance.requestKey,
      'RebillId': instance.rebillId,
      'CardId': instance.cardId,
      'ACSUrl': instance.acsUrl,
      'MD': instance.md,
      'PaReq': instance.paReq,
    };

const _$StatusEnumMap = {
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
