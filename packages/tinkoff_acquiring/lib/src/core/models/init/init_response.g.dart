// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitResponse _$InitResponseFromJson(Map<String, dynamic> json) => InitResponse(
      status: $enumDecodeNullable(_$StatusEnumMap, json['Status']),
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      details: json['Details'] as String?,
      terminalKey: json['TerminalKey'] as String?,
      amount: json['Amount'] as int?,
      orderId: json['OrderId'] as String?,
      paymentId: json['PaymentId'] as String?,
      paymentURL: json['PaymentURL'] as String?,
    );

Map<String, dynamic> _$InitResponseToJson(InitResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Status': _$StatusEnumMap[instance.status],
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'Amount': instance.amount,
      'OrderId': instance.orderId,
      'PaymentId': instance.paymentId,
      'PaymentURL': instance.paymentURL,
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
