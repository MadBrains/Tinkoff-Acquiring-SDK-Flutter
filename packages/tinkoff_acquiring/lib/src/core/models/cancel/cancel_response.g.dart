// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelResponse _$CancelResponseFromJson(Map<String, dynamic> json) =>
    CancelResponse(
      status: $enumDecodeNullable(_$StatusEnumMap, json['Status']),
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      orderId: json['OrderId'] as String?,
      paymentId: json['PaymentId'] as String?,
      originalAmount: json['OriginalAmount'] as int?,
      newAmount: json['NewAmount'] as int?,
    );

Map<String, dynamic> _$CancelResponseToJson(CancelResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Status': _$StatusEnumMap[instance.status],
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'OrderId': instance.orderId,
      'PaymentId': instance.paymentId,
      'OriginalAmount': instance.originalAmount,
      'NewAmount': instance.newAmount,
    };

const _$StatusEnumMap = {
  Status.newest: 'NEW',
  Status.formShowed: 'FORM_SHOWED',
  Status.deadlineExpired: 'DEADLINE_EXPIRED',
  Status.canceled: 'CANCELED',
  Status.preAuthorizing: 'PREAUTHORIZING',
  Status.authorizing: 'AUTHORIZING',
  Status.authorized: 'AUTHORIZED',
  Status.authFail: 'AUTH_FAIL',
  Status.rejected: 'REJECTED',
  Status.threeDsChecking: '3DS_CHECKING',
  Status.threeDsChecked: '3DS_CHECKED',
  Status.reversing: 'REVERSING',
  Status.partialReversed: 'PARTIAL_REVERSED',
  Status.reversed: 'REVERSED',
  Status.confirming: 'CONFIRMING',
  Status.confirmed: 'CONFIRMED',
  Status.refunding: 'REFUNDING',
  Status.partialRefunded: 'PARTIAL_REFUNDED',
  Status.refunded: 'REFUNDED',
};
