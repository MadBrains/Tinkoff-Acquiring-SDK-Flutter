// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_3ds_authorization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Submit3DSAuthorizationResponse _$Submit3DSAuthorizationResponseFromJson(
    Map<String, dynamic> json) {
  return Submit3DSAuthorizationResponse(
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
    success: json['Success'] as bool,
    errorCode: json['ErrorCode'] as String,
    message: json['Message'] as String,
    details: json['Details'] as String,
    terminalKey: json['TerminalKey'] as String,
    amount: json['Amount'] as int,
    orderId: json['OrderId'] as String,
    paymentId: json['PaymentId'] as String,
    rebillId: json['RebillId'] as int,
    cardId: json['CardId'] as String,
  );
}

Map<String, dynamic> _$Submit3DSAuthorizationResponseToJson(
        Submit3DSAuthorizationResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'Status': _$StatusEnumMap[instance.status],
      'ErrorCode': instance.errorCode,
      'Message': instance.message,
      'Details': instance.details,
      'TerminalKey': instance.terminalKey,
      'OrderId': instance.orderId,
      'Amount': instance.amount,
      'PaymentId': instance.paymentId,
      'RebillId': instance.rebillId,
      'CardId': instance.cardId,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

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
