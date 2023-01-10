// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPayments _$OrderPaymentsFromJson(Map<String, dynamic> json) =>
    OrderPayments(
      paymentId: json['PaymentId'] as String?,
      amount: json['Amount'] as int?,
      status: $enumDecodeNullable(_$StatusEnumMap, json['Status']),
      rrn: json['RRN'] as String?,
      success: json['Success'] as bool?,
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
    );

Map<String, dynamic> _$OrderPaymentsToJson(OrderPayments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PaymentId', instance.paymentId);
  writeNotNull('Amount', instance.amount);
  writeNotNull('Status', _$StatusEnumMap[instance.status]);
  writeNotNull('RRN', instance.rrn);
  writeNotNull('Success', instance.success);
  writeNotNull('ErrorCode', instance.errorCode);
  writeNotNull('Message', instance.message);
  return val;
}

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
  Status.loopChecked: 'LOOP_CHECKED',
  Status.completed: 'COMPLETED',
  Status.proccesing: 'PROCCESING',
  Status.active: 'ACTIVE',
  Status.inacitve: 'INACITVE',
};
